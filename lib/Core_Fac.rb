class Core_Fac
  def parse_fac
    op = Core_Op.new
    op.parse_op
    if @tokenizer.current_token == '*'
      @tokenizer.get_next_token
      f = Core_Fac.new
      f.parse_face
    end
  end
  def print_fac
  end
  def exec_fac
  end
end