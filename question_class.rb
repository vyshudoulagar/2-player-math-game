class Question
    def initialize(player)
        @current_player = player
        @num1 = rand(1..20)   # create random number between 1 to 20
        @num2 = rand(1..20)
        @answer = @num1 + @num2
    end

    # method to print question
    def ask_question
        puts "---- NEW TURN ----"
        puts "#{@current_player.name}: What does #{@num1} plus #{@num2} equal?"
        print ">"
    end

    # method to check if answer is true, takes a value as argument
    def is_answer_true(value)
        value.to_i == @answer   # convert value to integer before checking
    end
end