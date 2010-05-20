class Core_In
  def initialize
    @read
    @semi
    @idl
    @arrlist = []
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
    il = @idl
    arrayify_id_list(il)
    @arrlist.size.times do |i|
      val = Core_Prog.readval.shift
      Core_Prog.id_list[@arrlist[i]] = val
    end
  end
  
  def arrayify_id_list list
    unless list.first.nil?
      @arrlist << list.first
      arrayify_id_list(list.rest) unless list.rest.nil?
    end
  end
end