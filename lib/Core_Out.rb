class Core_Out
  def initialize
    @write
    @idl
    @semi
    self.parse_out
  end
  
  def parse_out
    @write = Tokenizer.instance.get_next_token #burn write
    @idl   = Core_Id_List.new
    @semi  = Tokenizer.instance.get_next_token #burn ;
  end
  
  def print_out t
    Core_Prog.print_tab(t)
    print "#{@write} "
    @idl.print_id_list(t)
    puts "#{@semi}"
  end
  
  def exec_out
    print @idl.exec_id_list
  end
end