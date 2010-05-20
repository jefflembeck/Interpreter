require 'lib/Extend_String'
require 'singleton'

class Tokenizer
  include Singleton
  
  attr_accessor :source, :blocks
             
  def initialize
  end
  
  def setup filename
     @source = IO.readlines(filename, '') unless filename.empty?
     @blocks = source.to_s.split(' ') unless filename.empty?
  end
  
  def get_next_token
    if valid_token?(self.blocks.first)
      self.blocks.shift
    elsif self.blocks.first =~ /end/
      self.blocks.first.slice!(0..2)
    else
      get_token_from_block
    end
  end
  
  def lookahead
    t = get_next_token
    unget_token(t)
    t
  end
  
  def unget_token t
    self.blocks.unshift(t)
  end
  
  def get_token_from_block
    tokens = block_buster(self.blocks.shift).reverse.each do |token|
      self.blocks.unshift(token) 
    end
    self.blocks.shift
  end
  
  def valid_token? t
    t.whitespace? || t.integer? || t.identifier? || t.symbol? || t.keyword?
  end
  
  def block_buster block
    count = 0
    foo = block.split(//).inject([""]) do |arr,e|
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
