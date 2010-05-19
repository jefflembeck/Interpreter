require 'lib/Core_Fac'

class Core_Exp
  
  def initialize
    @fac
    @plusorminus
    @exp
    @value
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
    unless @exp.nil?
      print " #{@plusorminus} "
      @exp.print_exp(t)
    end
  end
  def exec_exp
    if !@exp.nil?
      if @plusorminus == "+"
        @value = @fac.exec_fac + @exp.exec_exp
      else
        @value = @fac.exec_fac - @exp.exec_exp
      end
    else
      @value = @fac.exec_fac
    end
    @value
  end
end