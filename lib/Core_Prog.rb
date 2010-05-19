require 'lib/Core_Decl_Seq'
require 'lib/Core_Stmt_Seq'
require 'lib/Tokenizer'


class Core_Prog
  def initialize
    @program
    @begin
    @end
    @ds
    @ss
    @@id_list = {}
    @@ok_to_add = false
    self.parse_prog
  end

  def parse_prog
    @program = Tokenizer.instance.get_next_token #burn program
    raise InvalidCoreProgram.new("First word needs to be program") if @program != 'program'
    @@ok_to_add = true
    @ds = Core_Decl_Seq.new
    @@ok_to_add = false
    @begin = Tokenizer.instance.get_next_token #grab begin
    @ss = Core_Stmt_Seq.new
    @end = Tokenizer.instance.get_next_token #burn end
  end
  
  def print_prog
    puts "#{@program}"
    print "\t"
    @ds.print_decl_seq
    puts "#{@begin}"
    print "\t"
    @ss.print_stmt_seq
    puts "#{@end}"
  end
  
  def exec_prog
  end
  
  def self.ok_to_add?
    @@ok_to_add
  end
  
  def self.id_list
    @@id_list
  end
end