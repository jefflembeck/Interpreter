class Core_Comp_Op
  
  def initialize
    @op = Tokenizer.instance.get_next_token #grab the comp op
    self.parse_comp_op
  end
  
  def parse_comp_op
    raise InvalidCoreProgram.new("Broken Comp Op - #{@op}") if !@op.comp_symbol?
  end
  
  def print_comp_op
  end
  
  def exec_comp_op
  end
  
end