module BrainAnipoko

    class Interpreter
        attr_accessor :machine

        def initialize(filename:)
            tokenizer = BrainAnipoko::Tokenizer.new(filename: filename)
            program = BrainAnipoko::Program.new(tokenizer: tokenizer)
            self.machine = BrainAnipoko::Machine.new(program: program)
        end

        def run
            machine.run
        end
    end
end