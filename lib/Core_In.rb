class Core_In
  def initialize
    @read
    @semi
    @idl
    self.parse_in
  end
  def parse_in
    @read = Tokenizer.instance.get_next_token #burn read
    @idl  = Core_Id_List.new
    @semi = Tokenizer.instance.get_next_token #burn ;
  end
  def print_in t
    Core_Prog.print_tab(t)
    print "#{@read} "
    @idl.print_id_list(t)
    puts "#{@semi}"
  end
  def exec_in
  end
end