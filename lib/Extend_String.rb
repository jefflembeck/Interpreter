# Extending string class

class String
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

      def whitespace?
        self.match(/\A\s+\Z/) == nil ? false : true
      end
      
      def letters?
        upcase? || downcase?
      end
end
