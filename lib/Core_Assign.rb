require 'lib/Core_Id'
require 'lib/Core_Exp'

class Core_Assign
  
  def initialize
    @id
    @equals
    @exp
    @semi
    self.parse_assign
  end
  
  def parse_assign
    @id     = Core_Id.new
    @equals = Tokenizer.instance.get_next_token #burn =
    @exp    = Core_Exp.new
    @semi   = Tokenizer.instance.get_next_token #burn ;
  end
  
  def print_assign t
    Core_Prog.print_tab(t)
    @id.print_id(t)
    print " #{@equals} "
    @exp.print_exp(t)
    puts "#{@semi}"
  end
  def exec_assign
  end
end