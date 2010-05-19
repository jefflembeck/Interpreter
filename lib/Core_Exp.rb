require 'lib/Core_Fac'

class Core_Exp
  
  def initialize
    self.parse_exp
  end
  
  def parse_exp
    f = Core_Fac.new
    if (Tokenizer.instance.lookahead == '+' || Tokenizer.instance.lookahead == '-')
      Tokenizer.instance.get_next_token
      e = Core_Exp.new
    end
  end
  def print_exp
  end
  def exec_exp
  end
end