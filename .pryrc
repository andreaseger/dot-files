# -*- mode: ruby; -*-

unless defined? JRUBY_VERSION
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
end

# == PLUGINS ===
# awesome_print gem: great syntax colorized printing
# look at ~/.aprc for more settings for awesome_print
begin
  require 'awesome_print'
  AwesomePrint.defaults = {
    indent: 2,
    index: false
  }
  AwesomePrint.pry!
  require 'hirb'
rescue LoadError
  #puts "missing gems"
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

# local methods helper
# http://rakeroutes.com/blog/customize-your-irb/
class Object
  def local_methods
    case self.class
    when Class
      self.public_methods.sort - Object.public_methods
    when Module
      self.public_methods.sort - Module.public_methods
    else
      self.public_methods.sort - Object.new.public_methods
    end
  end
end

if defined?(PryByebug) || defined?(PryNav)
  Pry.commands.alias_command 'c', 'continue'
  Pry.commands.alias_command 's', 'step'
  Pry.commands.alias_command 'n', 'next'
  # Pry.commands.alias_command 'f', 'finish'
end
