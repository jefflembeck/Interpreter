class Core_Loop
  def initialize
  end
  def parse_loop
    @tokenizer.get_next_token
    c = Core_Cond.new
    c.parse_cond
    @tokenizer.get_next_token
    ss = Core_Stmt_Seq.new
    ss.parse_stmt_seq
    @tokenizer.get_next_token
    @tokenizer.get_next_token
  end
  def print_loop
  end
  def exec_loop
  end
end