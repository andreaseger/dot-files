# Make gems available
require 'rubygems'
require 'ap'
require 'pp'
require 'hirb'
require 'hirb/import_object'
require 'irb/completion'
require 'irb/ext/save-history'
require 'wirble'

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


# Draw ASCII tables
Hirb.enable
extend Hirb::Console

IRB.conf[:USE_READLINE] = true
IRB.conf[:PROMPT_MODE]  = :SIMPLE
IRB.conf[:AUTO_INDENT]=true
IRB.conf[:SAVE_HISTORY] = 100
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-save-history"

# Wirble is a set of enhancements for irb
Wirble.init
Wirble.colorize

# Clear the screen
def clear
	system 'clear'
	if ENV['RAILS_ENV']
		return "Rails environment: " + ENV['RAILS_ENV']
	else
		return "No rails environment - happy hacking!";
	end
end

# Shortcuts
alias c clear
alias p pp
# Load / reload files faster
# http://www.themomorohoax.com/2009/03/27/irb-tip-load-files-faster
def fl(file_name)
   file_name += '.rb' unless file_name =~ /\.rb/
   @@recent = file_name 
   load "#{file_name}"
end

def rl
  fl(@@recent)
end

# Reload the file and try the last command again
# http://www.themomorohoax.com/2009/04/07/ruby-irb-tip-try-again-faster
def rt
  rl
  eval(choose_last_command)
end

# prevent 'rt' itself from recursing. 
def choose_last_command
  real_last = Readline::HISTORY.to_a[-2]
  real_last == 'rt' ? @@saved_last :  (@@saved_last = real_last)
end

# Method to pretty-print object methods
# Coded by sebastian delmont
# http://snippets.dzone.com/posts/show/2916
class Object
  ANSI_BOLD       = "\033[1m"
  ANSI_RESET      = "\033[0m"
  ANSI_LGRAY    = "\033[0;37m"
  ANSI_GRAY     = "\033[1;30m"

  # Print object's methods
  def pm(*options)
    methods = self.methods
    methods -= Object.methods unless options.include? :more
    filter = options.select {|opt| opt.kind_of? Regexp}.first
    methods = methods.select {|name| name =~ filter} if filter

    data = methods.sort.collect do |name|
      method = self.method(name)
      if method.arity == 0
        args = "()"
      elsif method.arity > 0
        n = method.arity
        args = "(#{(1..n).collect {|i| "arg#{i}"}.join(", ")})"
      elsif method.arity < 0
        n = -method.arity
        args = "(#{(1..n).collect {|i| "arg#{i}"}.join(", ")}, ...)"
      end
      klass = $1 if method.inspect =~ /Method: (.*?)#/
      [name, args, klass]
    end
    max_name = data.collect {|item| item[0].size}.max
    max_args = data.collect {|item| item[1].size}.max
    data.each do |item| 
      print " #{ANSI_BOLD}#{item[0].to_s.rjust(max_name)}#{ANSI_RESET}"
      print "#{ANSI_GRAY}#{item[1].ljust(max_args)}#{ANSI_RESET}"
      print "   #{ANSI_LGRAY}#{item[2]}#{ANSI_RESET}\n"
    end
    data.size
  end
end

# http://sketches.rubyforge.org/
require 'sketches'
Sketches.config :editor => 'vim'

# Bond (Bash-like tab completion)
require 'bond'
Bond.start

# Quick way to run just a few specific lines from a file
def eval_lines(fn, lines)
  eval( File.readlines(fn)[lines].join)
end
class Object
  def mymethods
    methods-Object.methods
  end
end
