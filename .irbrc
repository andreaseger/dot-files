# -*- mode: ruby; -*-

# Make gems available
require 'irb/completion'
require 'irb/ext/save-history'

IRB.conf[:USE_READLINE] = true
IRB.conf[:PROMPT_MODE]  = :SIMPLE
IRB.conf[:AUTO_INDENT]=true
IRB.conf[:SAVE_HISTORY] = 100
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-save-history"

#begin
#  require 'awesome_print'
#  unless IRB.version.include?('DietRB')
#    IRB::Irb.class_eval do
#      def output_value
#        ap @context.last_value
#      end
#    end
#  else # MacRuby
#    IRB.formatter = Class.new(IRB::Formatter) do
#      def inspect_object(object)
#        object.ai
#      end
#    end.new
#  end
#rescue
#end

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
