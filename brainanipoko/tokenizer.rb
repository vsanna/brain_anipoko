module BrainAnipoko
    class Tokenizer
        attr_accessor :filename
        attr_accessor :source
        attr_accessor :current_position

        TOKEN_TABLE = {
            # TODO: refactor namespace
            'あ': BrainAnipoko::Token::MOVE_RIGHT,
            'ピ': BrainAnipoko::Token::MOVE_LEFT,
            'ぽ': BrainAnipoko::Token::INCREMENT,
            'ナ': BrainAnipoko::Token::DECREMENT,
            'く': BrainAnipoko::Token::OUTPUT,
            'オ': BrainAnipoko::Token::INPUT,
            'に': BrainAnipoko::Token::BRACKET_LEFT,
            'な': BrainAnipoko::Token::BRACKET_RIGHT,
            # '#': BrainAnipoko::Token::COMMENT,
            nil => BrainAnipoko::Token::EOF,
        }

        #
        # @param [String] filename
        #
        def initialize(filename:)
            unless File.exists?(filename)
                raise ArgumentError, "#{filename} doesn't exist"
            end

            self.filename = filename
            self.source = ''
            read_source

            self.current_position = -1
        end

        #
        # @return [Token]
        #
        def next_token
            token = lookup_token(next_char)
            self.current_position += (token[:literal].size - 1)
            # puts token
            return token
        end

        private

        def read_source
            File.open(filename) do |file|
                self.source = file.read
            end
        end

        #
        # @return [Boolean]
        #
        def next_is_blank?
            ["\s", "\n", "\r", "\t", "\v"].include?(source[current_position + 1])
        end
    
        #
        # @param [String] char
        # @return [Token]
        #
        def lookup_token(char)
            TOKEN_TABLE[char&.to_sym]
        end

        #
        # @return [String]
        # 
        def next_char
            while(next_is_blank?) do
                self.current_position += 1
            end
            self.current_position += 1
            source[current_position]
        end
    end
end
