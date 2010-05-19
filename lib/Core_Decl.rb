require 'lib/Core_Id_List'

class Core_Decl
  
  def initialize
    @int
    @semi
    @idl
    self.parse_decl
  end
  
  def parse_decl
    @int = Tokenizer.instance.get_next_token #grabs int
    @idl = Core_Id_List.new
    @semi = Tokenizer.instance.get_next_token #grabs ;
  end
  
  def print_decl
    print "#{@int} "
    @idl.print_id_list
    puts "#{@semi}"
  end
  
  def exec_decl
  end
end