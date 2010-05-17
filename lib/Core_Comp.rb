class Core_Comp
  def parse_comp
    @tokenizer.get_next_token
    op = Core_Op.new
    op.parse_op
    compop = Core_Comp_Op.new
    compop.parse_comp_op
    op2 = Core_Op.new
    op2.parse_op
    @tokenizer.get_next_token
  end
  def print_comp
  end
  def exec_comp
  end
end