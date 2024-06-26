require_relative 'player_class'
require_relative 'question_class'
require_relative 'start_game_class'

# create player objects
player1 = Player.new('Player1', 3, 0)
player2 = Player.new('Player2', 3, 0)

# create an array of player objects
players = [player1, player2]

# create an object for game and give players array as an argument
game1 = StartGame.new(players, 0)
game1.play_loop