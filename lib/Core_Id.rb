require 'lib/Core_Prog'

class Core_Id
  
  def initialize
    @id = Tokenizer.instance.get_next_token#grabs ID
    if Core_Prog.ok_to_add?
      Core_Prog.id_list[@id] = nil
    end
    self.parse_id
  end
  
  def parse_id
    raise InvalidCoreProgram.new("Broken Id - #{@id}") if !@id.identifier?
  end
  
  def print_id
    print "#{@id}"
  end
  
  def exec_id
  end
end