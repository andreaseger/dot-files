# -*- mode: ruby; -*-

# Make gems available
require 'irb/completion'
require 'irb/ext/save-history'

IRB.conf[:USE_READLINE] = true
IRB.conf[:PROMPT_MODE]  = :SIMPLE
IRB.conf[:AUTO_INDENT]=true
IRB.conf[:SAVE_HISTORY] = 100
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-save-history"

#if defined? Bundler
#  Gem.post_reset_hooks.reject! { |hook| hook.source_location.first =~ %r{/bundler/} }
#  Bundler.preserve_gem_path
#  Gem.clear_paths
#  Gem::Specification.reset
#  if Gem::VERSION.to_i >= 2
#    load 'rubygems/core_ext/kernel_require.rb'
#  else
#    load 'rubygems/custom_require.rb'
#  end
#  Kernel.module_eval do
#    def gem(gem_name, *requirements) # :doc:
#      skip_list = (ENV['GEM_SKIP'] || "").split(/:/)
#      raise Gem::LoadError, "skipping #{gem_name}" if skip_list.include? gem_name
#      spec = Gem::Dependency.new(gem_name, *requirements).to_spec
#      spec.activate if spec
#    end
#  end
#end


begin
  require 'awesome_print'
  unless IRB.version.include?('DietRB')
    IRB::Irb.class_eval do
      def output_value
        ap @context.last_value
      end
    end
  else # MacRuby
    IRB.formatter = Class.new(IRB::Formatter) do
      def inspect_object(object)
        object.ai
      end
    end.new
  end
rescue
end



# Clear the screen
def clear
	system 'clear'
	if ENV['RAILS_ENV']
		return "Rails environment: " + ENV['RAILS_ENV']
	else
		return "No rails environment - happy hacking!";
	end
end

def eval_lines(fn, lines)
  eval( File.readlines(fn)[lines].join)
end
class Object
  def mymethods
    methods-Object.methods
  end
end
