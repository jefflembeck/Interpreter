require 'lib/Core_Fac'

class Core_Exp
  
  def initialize
    @fac
    @plusorminus
    @exp
    self.parse_exp
  end
  
  def parse_exp
    @fac = Core_Fac.new
    if (Tokenizer.instance.lookahead == '+' || Tokenizer.instance.lookahead == '-')
      @plusorminus = Tokenizer.instance.get_next_token
      @exp         = Core_Exp.new
    end
  end
  def print_exp t
    @fac.print_fac(t)
    print "#{@plusorminus}"
    unless @exp.nil?
      @exp.print_exp(t)
    end
  end
  def exec_exp
  end
end