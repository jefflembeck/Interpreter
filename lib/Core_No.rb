require 'error/InvalidCoreProgram'

class Core_No
  def initialize
    @no = Tokenizer.instance.get_next_token
    self.parse_no
  end
  
  def parse_no
    raise InvalidCoreProgram.new("Broken Number - #{no}") if !@no.integer?
  end
  
  def print_no t
    print "#{@no}"
  end
  
  def exec_no
    @no
  end

end