class StartGame
    def initialize(players, current_player_index)
        @players = players
        @current_player_index = current_player_index
        @current_player = @players[@current_player_index]
    end

    # method to start the loop for each player
    def play_loop
        # create question object for current player
        q = Question.new(@current_player)
        q.ask_question
        answer = $stdin.gets.chomp   # get the input from user
        if q.is_answer_true(answer)  # check if the input is true
            puts "#{@current_player.name}: Yes! You are correct."
            @current_player.add_score  # increment player's score
            puts "P1: Score: #{@players[0].score}, Lives: #{@players[0].lives}/3 vs P2: Score: #{@players[1].score}, Lives: #{@players[1].lives}/3"
        else
            puts "#{@current_player.name}: Seriously? No!"
            @current_player.lose_life  # decrement player's no. of lives
            puts "P1: Score: #{@players[0].score}, Lives: #{@players[0].lives}/3 vs P2: Score: #{@players[1].score}, Lives: #{@players[1].lives}/3"
        end
        self.switch_turn  # switch player
    end

    # method to switch player once a loop is done
    def switch_turn
        if @current_player.is_alive
            @current_player_index = (@current_player_index == 0) ? 1 : 0
            @current_player = @players[@current_player_index]
            self.play_loop
        else
            game_over
        end
    end

    # called if a player has 0 lives
    def game_over
        winner = @players.find { |player| player.is_alive }  # find the player whose no. of lives is > 0
        puts "#{winner.name} wins with a score of #{winner.score}"
        puts "---- GAME OVER ----"
        puts "Good bye!"
    end
end