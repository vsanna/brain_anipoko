module BrainAnipoko 
    class Program
        attr_accessor :tokens
        attr_accessor :pos
        attr_accessor :tokenizer

        def initialize(tokenizer: )
            self.tokenizer = tokenizer
            self.tokens = []
            self.pos = -1
            build_tokens
        end

        #
        # @return [BrainAnipoko::Token]
        #
        def next_token
            # TBD: refactor
            if pos + 1 >= tokens.size
                return BrainAnipoko::Token::EOF
            end

            # puts pos

            self.pos += 1
            current_token
        end

        #
        # @return [BrainAnipoko::Token]
        #
        def current_token
            tokens[pos]
        end

        def back_to_loop_beginning
            stack = []

            loop do
                if peek_previous_token == BrainAnipoko::Token::BRACKET_LEFT && stack.size == 0
                    self.pos -= 1
                    break
                end 

                self.pos -= 1
                
                if pos < 0 
                    raise StandardError, "cannot find opening bracket."
                end

                if current_token == BrainAnipoko::Token::BRACKET_RIGHT
                    stack.push(pos)
                end
                if current_token == BrainAnipoko::Token::BRACKET_LEFT
                    stack.pop
                end
            end

            # To make next_token as BRACKET_LEFT
            self.pos -= 1
        end

        def skip_to_loop_end
            stack = []

            loop do
                if peek_next_token == BrainAnipoko::Token::BRACKET_RIGHT && stack.size == 0
                    self.pos += 1
                    break
                end 

                self.pos += 1
                
                if pos + 1 == tokens.size
                    raise StandardError, "cannot find closing bracket."
                end

                if current_token == BrainAnipoko::Token::BRACKET_LEFT
                    stack.push(pos)
                end
                if current_token == BrainAnipoko::Token::BRACKET_RIGHT
                    stack.pop
                end
            end

            # To make next_token as BRACKET_LEFT
            self.pos -= 1
        end

        private

        def build_tokens
            loop do
                self.tokens.push(tokenizer.next_token)
                if tokens.last == BrainAnipoko::Token::EOF
                    break
                end
            end
        end

        def peek_previous_token
            tokens[pos-1]
        end

        def peek_next_token
            tokens[pos+1]
        end
    end
end