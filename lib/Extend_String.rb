# Extending string class

class String
  
  KEYWORDS = {"program" => 1, "begin" => 2, "end" => 3, 
              "int" => 4, "if" => 5, "then" => 6, "else" => 7, 
              "while" => 8, "loop" => 9, "read" => 10, "write" => 11}
                                
  SYMBOLS = {";" => 12, "," => 13, "=" => 14, "!" => 15, "[" => 16, "]" => 17, "&&" => 18,
             "||" => 19, "(" => 20, ")" => 21, "+" => 22, '-' => 23, "*" => 24, "!=" => 25,
             "==" => 26, "<" => 27, ">" => 28, "<=" => 29, ">=" => 30 }
             
      def upcase?
        self.match(/\A[A-Z]+\Z/) == nil ? false : true
      end

      def downcase?
        self.match(/\A[a-z]+\Z/) == nil ? false : true
      end

      def integer?
        self.match(/\A\d+\Z/) == nil ? false : true 
      end

      def identifier?
        self.match(/\A[A-Z]+\d*\Z/) == nil ? false : true
      end
      
      def symbol?
        [';',',','=', '!', '[', ']', '&', '|', '(', ')', '+', '-', '*', '<', '>'].include?(self)
      end
      
      def comp_symbol?
        ['=', '!=', '==', '<', '>', '<=', '>='].include?(self)
      end

      def whitespace?
        self.match(/\A\s+\Z/) == nil ? false : true
      end
      
      def letters?
        upcase? || downcase?
      end
      
      def statement_starter?
        self.match(/\A(if|while|read|write|[A-Z]+\d*)\Z/) == nil ? false : true
      end
      
      def keyword?
        KEYWORDS.has_key?(self)
      end

      def symbol?
        SYMBOLS.has_key?(self) 
      end
end
