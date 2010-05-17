require 'lib/Core_Decl_Seq'
require 'lib/Core_Stmt_Seq'
require 'lib/tokenizer'


class Core_Prog
  @ds = new Core_Decl_Seq
  @ss = new Core_Stmt_Seq
  
  def parse_core_prog
    @tokenizer.get_next_token
  end
  
  def print_core_prog
  end
  
  def exec_core_prog
  end
  
end