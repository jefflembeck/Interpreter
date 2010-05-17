class Core_Out
  def parse_out
    @tokenizer.get_next_token
    idl = Core_Id_List.new
    idl.parse_id_list
    @tokenizer.get_next_token
  end
  def print_out
  end
  def exec_out
  end
end