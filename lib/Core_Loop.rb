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
  
  def print_loop
    print "#{@while} "
    @c.print_cond
    puts "#{@loop}"
    @ss.print_stmt_seq
    print "#{@end}"
    puts "#{@semi}"
  end
  
  def exec_loop
  end
end