module BrainAnipoko 
    Token = Struct.new(:name, :literal)
    # Token::MOVE_RIGHT    = Token.new('move_right', '>') 
    # Token::MOVE_LEFT     = Token.new('move_left', '<')
    # Token::INCREMENT     = Token.new('increment', '+')
    # Token::DECREMENT     = Token.new('decrement', '-')
    # Token::OUTPUT        = Token.new('output', '.')
    # Token::INPUT         = Token.new('input', ',')
    # Token::BRACKET_LEFT  = Token.new('bracket_left', '[')
    # Token::BRACKET_RIGHT = Token.new('bracket_right', ']')
    Token::MOVE_RIGHT    = Token.new('move_right', 'あに')       # >
    Token::MOVE_LEFT     = Token.new('move_left', 'ピー')        # <
    Token::INCREMENT     = Token.new('increment', 'ぽこ')        # +
    Token::DECREMENT     = Token.new('decrement', 'ナッツ')      # -
    Token::OUTPUT        = Token.new('output', 'くん')           # .
    Token::INPUT         = Token.new('input', 'オシャレ')         # ,
    Token::BRACKET_LEFT  = Token.new('bracket_left', 'に')       # [ 
    Token::BRACKET_RIGHT = Token.new('bracket_right', 'なりたい') # ]
    # Token::COMMENT       = Token.new('comment', '#')
    Token::EOF           = Token.new('eof', 'nil')
end