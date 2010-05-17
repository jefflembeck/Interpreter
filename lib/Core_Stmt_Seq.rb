class Core_Stmt_Seq
  def initialize
    s = Core_Stmt.new
    @ss =[]
  end
  
  def parse_stmt_seq
    s.parse_stmt
  end
  
  def print_stmt_seq
  end
  
  def exec_stmt_seq
  end
end