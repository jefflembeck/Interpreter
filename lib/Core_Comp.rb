require 'lib/Core_Comp_Op'

class Core_Comp
  
  def initialize
    self.parse_comp
  end 
  
  def parse_comp
    Tokenizer.instance.get_next_token #get (
    op = Core_Op.new
    compop = Core_Comp_Op.new
    op2 = Core_Op.new
    Tokenizer.instance.get_next_token #burn )
  end
  def print_comp
  end
  def exec_comp
  end
end