class Core_If
  def parse_if
    @tokenizer.get_next_token
    c = Core_Cond.new
    c.parse_cond
    @tokenizer.get_next_token
    ss = Core_Stmt_Seq.new
    ss.parse_stmt_seq
    @tokenizer.get_next_token
    case @tokenizer.current_token
    when "end"
      @tokenizer.get_next_token
    when "else"
      ss2 = Core_Stmt_Seq.new
      ss2.parse_stmt_seq
      @tokenizer.get_next_token
      @tokenizer.get_next_token
    else
      ERROR
  end
  def print_if
  end
  def exec_if
  end
end