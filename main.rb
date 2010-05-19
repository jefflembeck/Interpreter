require 'lib/Tokenizer'
require 'lib/Core_Prog'
require 'rubygems'
require 'ruby-debug'

filename = ARGV[0]
@tokenizer = Tokenizer.instance

Tokenizer.instance.setup(filename)

begin
  p = Core_Prog.new
  p.print_prog
  p.exec_prog

rescue Errno::ENOENT
  print "Can't find that filename, sorry.  Try again: "
  filename = STDIN.gets.chomp
  retry
rescue TypeError
  print "Needs a filename, please enter one for testing: "
  filename = STDIN.gets.chomp
  retry
end

