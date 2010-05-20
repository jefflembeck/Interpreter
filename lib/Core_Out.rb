class Core_Out
  def initialize
    @write
    @idl
    @semi
    @arrlist = []
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
    il = @idl
    arrayify_id_list(il) 
    f = File.open("writefile.txt", "w")
    @arrlist.size.times do |n|
      f.write("#{@arrlist[n]} #{Core_Prog.id_list[@arrlist[n]]} \n")
    end
  end
  
  def arrayify_id_list list
    unless list.first.nil?
      @arrlist << list.first
      arrayify_id_list(list.rest) unless list.rest.nil?
    end
  end
end