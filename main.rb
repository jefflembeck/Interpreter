require 'lib/Tokenizer'
require 'lib/Core_Prog'
require 'rubygems'
require 'ruby-debug'

filename = ARGV[0]

Tokenizer.instance.setup(filename)

p = Core_Prog.new
p.print_prog
p.exec_prog


