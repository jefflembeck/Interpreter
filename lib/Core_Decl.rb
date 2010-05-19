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
  
  def print_decl t
    Core_Prog.print_tab(t)
    print "#{@int} "
    @idl.print_id_list(t)
    puts "#{@semi}"
  end
  
  def exec_decl
  end
end