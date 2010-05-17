class Core_Op
  def parse_op
    t = @tokenizer.current_token
    if t.integer?
      n = Core_No.new
      n.parse_no
    elsif t.letters?
      i = Core_Id.new
      i.parse_id
    elsif t == '('
      @tokenizer.get_next_token
      e = Core_Exp.new
      e.parse_exp
      @tokenizer.get_next_token
    else ERROR
    end
  end
  def print_op
  end
  def exec_op
  end
end