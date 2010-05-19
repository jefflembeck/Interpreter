require 'lib/Core_No'
require 'lib/Core_Id'
require 'lib/Core_Exp'

class Core_Op
  def initialize
    self.parse_op
  end
  
  def parse_op
    t = Tokenizer.instance.lookahead
    if t.integer?
      n = Core_No.new
    elsif t.identifier?
      i = Core_Id.new
    elsif t == '('
      Tokenizer.instance.get_next_token #burn (
      e = Core_Exp.new
      Tokenizer.instance.get_next_token #burn )
    else
      raise InvalidCoreProgram.new("Broken Op - #{t}")
    end
  end
  
  def print_op
  end
  
  def exec_op
  end
end