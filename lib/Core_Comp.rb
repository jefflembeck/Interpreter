require 'lib/Core_Comp_Op'

class Core_Comp
  
  def initialize
    @lp
    @op
    @compop
    @op2
    @rp
    self.parse_comp
  end 
  
  def parse_comp
    @lp     = Tokenizer.instance.get_next_token #get (
    @op     = Core_Op.new
    @compop = Core_Comp_Op.new
    @op2    = Core_Op.new
    @rp     = Tokenizer.instance.get_next_token #burn )
  end
  
  def print_comp t
    print "#{@lp}"
    @op.print_op(t)
    print " "
    @compop.print_comp_op(t)
    print " "
    @op2.print_op(t)
    print "#{@rp} "
  end
  
  def exec_comp
    begin
      result = @op.exec_op.send(@compop.exec_comp_op, @op2.exec_op)
    rescue NoMethodError  #ridiculous hack, wish that they would give us a relatively newer version of Ruby
      result = !@op.exec_op.send("==", @op2.exec_op)
    end
  end
end