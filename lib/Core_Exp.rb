class Core_Exp
  def parse_exp
    f = Core_Fac.new
    f.parse_fac
    if @tokenizer.current_token == '+' || @tokenizer.current_token == '-'
      @tokenizer.get_next_token
      e = Core_Exp.new
      e.parse_exp
    end
  end
  def print_exp
  end
  def exec_exp
  end
end