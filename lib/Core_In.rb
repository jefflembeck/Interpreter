class Core_In
  def initialize
  end
  def parse_in
    @tokenizer.get_next_token
    idl = Core_Id_List.new
    idl.parse_id_list
    @tokenizer.get_next_token
  end
  def print_in
  end
  def exec_in
  end
end