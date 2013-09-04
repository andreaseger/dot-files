# add all gems in the global gemset to the $LOAD_PATH so they can be used even
# in places like 'rails console'.
if defined?(::Bundler)
  global_gemset = ENV['GEM_PATH'].split(':').grep(/ruby.*@global/).first
  if global_gemset
    all_global_gem_paths = Dir.glob("#{global_gemset}/gems/*")
    all_global_gem_paths.each do |p|
      gem_path = "#{p}/lib"
      $LOAD_PATH << gem_path
    end
  end
end

begin
  require 'pry-nav'
  Pry.commands.alias_command 'c', 'continue'
  Pry.commands.alias_command 's', 'step'
  Pry.commands.alias_command 'n', 'next'
rescue
end

Pry.prompt = [
    proc {
        |obj, nest_level, _|
            prompt = ""
            prompt += "\001\e[01;38;5;202m\002"
            prompt += "#{RUBY_VERSION} "
            prompt += "\001\e[0m\002"
    },
    proc {
        |obj, nest_level, _|
            prompt = "#{RUBY_VERSION} (#{obj}):#{nest_level} *"
    }
]

# == PLUGINS ===
# awesome_print gem: great syntax colorized printing
# look at ~/.aprc for more settings for awesome_print
begin
  require 'awesome_print'
  #   # The following line enables awesome_print for all pry output,
  #   # and it also enables paging
  #   Pry.config.print = proc {|output, value| Pry::Helpers::BaseHelpers.stagger_output("=> #{value.ai}", output)}
  #   # If you want awesome_print without automatic pagination, use the line below
  Pry.config.print = proc { |output, value| output.puts value.ai }
rescue LoadError
end

begin
  require 'hirb'
rescue LoadError
  # Missing goodies, bummer
end

if defined? Hirb
  # Dirty hack to support in-session Hirb.disable/enable
  Hirb::View.instance_eval do
    def enable_output_method
      @output_method = true
      Pry.config.print = proc do |output, value|
        Hirb::View.view_or_page_output(value) || output.puts(value.ai)
      end
    end

    def disable_output_method
      Pry.config.print = proc { |output, value| output.puts(value.ai) }
      @output_method = nil
    end
  end
end


# === CONVENIENCE METHODS ===
# Stolen from https://gist.github.com/807492
# Use Array.toy or Hash.toy to get an array or hash to play with
class Array
  def self.toy(n=10, &block)
    block_given? ? Array.new(n,&block) : Array.new(n) {|i| i+1}
  end
end

class Hash
  def self.toy(n=10)
    Hash[Array.toy(n).zip(Array.toy(n){|c| (96+(c+1)).chr})]
  end
end


# autocompletion
begin
require 'bond'
Bond.start
rescue LoadError
end
require 'readline'
