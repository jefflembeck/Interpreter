class Core_Assign
  def parse_assign
    i = Core_Id.new
    i.parse_id
    @tokenizer.get_next_token
    e = Core_Exp.new
    e.parse_exp
    @tokenizer.get_next_token
  end
  def print_assign
  end
  def exec_assign
  end
end