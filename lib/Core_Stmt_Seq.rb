require 'lib/Core_Stmt'

class Core_Stmt_Seq
  def initialize
    @cs
    @css
    self.parse_stmt_seq
  end
  
  def parse_stmt_seq
    @cs = Core_Stmt.new
    if Tokenizer.instance.lookahead.statement_starter?
      @css = Core_Stmt_Seq.new
    end
  end
  
  def print_stmt_seq t
    @cs.print_stmt(t)
    unless @css.nil?
      @css.print_stmt_seq(t)
    end
  end
  
  def exec_stmt_seq
  end
end