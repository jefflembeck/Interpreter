class Core_Stmt
  def initialize
  end
  def parse_stmt
    case @tokenizer.current_token
    when "assign"
      a = Core_Assign.new
      a.parse_assign
    when "if"
      i = Core_If.new
      i.parse_if
    when "loop"
      l = Core_Loop.new
      l.parse_loop
    when "in"
      n = Core_In.new
      n.parse_in
    when "out"
      o = Core_Out.new
      o.parse_out
    else              
      ERROR
    end
  end
  
  def print_stmt
  end
  
  def exec_stmt
  end
end