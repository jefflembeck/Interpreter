class Core_Cond
  def parse_cond
    case @tokenizer.current_token
    when '('
      cmp = Core_Comp.new
      cmp.parse_comp
    when '!'
      @tokenizer.get_next_token
      cnd = Core_Cond.new
      cnd.parse_cond
    when '['
      @tokenizer.get_next_token
      cnd = Core_Cond.new
      cnd.parse_cond
      @tokenizer.get_next_token # burn && or ||
      cnd2 = Core_Cond.new
      cnd2.parse_cond
      @tokenizer.get_next_token
    else
      ERROR
  end
  def print_cond
  end
  def exec_cond
  end
end