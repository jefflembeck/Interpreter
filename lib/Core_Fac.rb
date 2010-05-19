require 'lib/Core_Op'

class Core_Fac
  
  def initialize
    @op
    @mul
    @fac
    self.parse_fac
  end
  
  def parse_fac
    @op = Core_Op.new
    if Tokenizer.instance.lookahead == '*'
      @mul = Tokenizer.instance.get_next_token # burn *
      @fac = Core_Fac.new
    end
  end
  def print_fac t
    @op.print_op(t)
    unless @fac.nil?
      print "#{@mul}"
      @fac.print_fac(t)
    end
  end
  def exec_fac
  end
end