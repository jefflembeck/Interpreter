require 'lib/Tokenizer'
require 'lib/Core_Prog'

filename = ARGV[0]

Tokenizer.instance.setup(filename)

p = Core_Prog.new
p.print_prog
p.exec_prog


