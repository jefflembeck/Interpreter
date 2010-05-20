class Core_Loop
  def initialize
    @while
    @loop
    @end
    @semi
    @c
    @ss
    self.parse_loop
  end
  
  def parse_loop
    @while = Tokenizer.instance.get_next_token #get while
    @c     = Core_Cond.new
    @loop  = Tokenizer.instance.get_next_token #get loop
    @ss    = Core_Stmt_Seq.new
    @end   = Tokenizer.instance.get_next_token #get end
    @semi  = Tokenizer.instance.get_next_token #get ;
  end
  
  def print_loop t
    Core_Prog.print_tab(t)
    print "#{@while} "
    @c.print_cond(t)
    puts "#{@loop}"
    t += 1
    @ss.print_stmt_seq(t)
    t -= 1
    Core_Prog.print_tab(t)
    print "#{@end}"
    puts "#{@semi}"
  end
  
  def exec_loop
    while (@c.exec_cond) do
      @ss.exec_stmt_seq
    end
  end
end