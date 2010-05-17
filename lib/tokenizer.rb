require 'lib/Extend_String.rb'

class Tokenizer
  
  attr_accessor :source, :chunks, :current_token
  

             
  def initialize(filename = '')
    @source = IO.readlines(filename, '') unless filename.empty?
    @chunks = self.source.to_s.split(' ') unless filename.empty?
  end

  def get_next_token
    if valid_token?(self.chunks.first)
      self.chunks.shift
    elsif self.chunks.first =~ /end/
      self.chunks.first.slice!(0..2)
    else
      get_token_from_chunk
    end
  end
  
  def get_token_from_chunk
    tokens = split_em(self.chunks.shift).reverse.each do |token|
      self.chunks.unshift(token) 
    end
    self.chunks.shift
  end
  
  def valid_token?(chunk)
    chunk.whitespace? || chunk.integer? || chunk.identifier? || chunk.symbol? || chunk.keyword?
  end
  
  def split_em(chunk)
    count = 0
    foo = chunk.split(//).inject([""]) do |arr,e|
      if self.valid_token?(arr[count] + e)
        arr[count] = arr[count] + e
        arr
      else
        count+=1
        arr << e
      end
    end
  end

  
end
