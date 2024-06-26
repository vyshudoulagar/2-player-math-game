class Player
    attr_accessor :name, :lives, :score

    def initialize(n, l, s)
        @name = n 
        @lives = l 
        @score = s 
    end

    # loses a life when called
    def lose_life
        @lives -= 1
    end

    # adds to score when called
    def add_score
        @score += 1
    end

    # checks if the player is alive by checking lives
    def is_alive
        @lives > 0
    end
end