class Player
    attr_reader :name, :lives
  
    def initialize(name)
      @name = name
      @lives = 3
    end
    def lose_life
        @lives -= 1 if @lives > 0  # Decrement lives only if not already 0
      end
    
      def lives
        @lives  # Getter method for read-only access to lives
      end
  end