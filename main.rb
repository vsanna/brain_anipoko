require "bundler"
Bundler.require

require_relative './brain_anipoko'

filename = ARGV[0]

interpreter = BrainAnipoko::Interpreter.new(filename: filename)

interpreter.run