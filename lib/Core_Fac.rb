require 'lib/Core_Op'

class Core_Fac
  
  def initialize
    self.parse_fac
  end
  
  def parse_fac
    op = Core_Op.new
    if Tokenizer.instance.lookahead == '*'
      Tokenizer.instance.get_next_token # burn *
      f = Core_Fac.new
    end
  end
  def print_fac
  end
  def exec_fac
  end
end