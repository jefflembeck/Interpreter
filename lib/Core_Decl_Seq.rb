require 'lib/Tokenizer'
require 'lib/Core_Decl'

class Core_Decl_Seq
  
  def initialize
    @cd
    @cds
    self.parse_decl_seq    
  end
  
  def parse_decl_seq
    @cd = Core_Decl.new
    if Tokenizer.instance.lookahead == 'int'
      @cds = Core_Decl_Seq.new
    end
  end
  
  def print_decl_seq t
    @cd.print_decl(t)
    @cds.print_decl_seq(t) unless @cds.nil?
  end
  
  def exec_decl_seq
  end
end