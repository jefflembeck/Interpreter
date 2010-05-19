require 'lib/Core_Comp.rb'

class Core_Cond
  
  def initialize
    @tok = Tokenizer.instance.lookahead
    self.parse_cond
  end
  
  def parse_cond
    case @tok
    when '('
      cmp = Core_Comp.new
    when '!'
      Tokenizer.instance.get_next_token #burn !
      negcnd = Core_Cond.new
    when '['
      Tokenizer.instance.get_next_token #burn [
      cnd = Core_Cond.new
      @andor = Tokenizer.instance.get_next_token # burn && or ||
      cnd2 = Core_Cond.new
      Tokenizer.instance.get_next_token #burn ]
    else
      raise InvalidCoreProgram.new("Broken Cond - #{@tok}")
    end
  end
  
  def print_cond
  end
  
  def exec_cond
  end
end