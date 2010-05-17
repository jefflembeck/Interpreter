require 'lib/Core_Decl_Seq'
require 'lib/Core_Stmt_Seq'
require 'lib/tokenizer'


class Core_Prog
  ds = Core_Decl_Seq.new
  ss = Core_Stmt_Seq.new
  
  def parse_core_prog
    @tokenizer.get_next_token
    ds.parse_decl_seq
    @tokenizer.get_next_token
    ss.parse_stmt_seq
    @tokenizer.get_next_token
  end
  
  def print_core_prog
  end
  
  def exec_core_prog
  end
  
end