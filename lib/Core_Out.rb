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
  
  def print_out
    print "#{@write} "
    @idl.print_id_list
    puts "#{@semi}"
  end
  
  def exec_out
  end
end