class Game
    attr_reader :player1, :player2, :current_player
  
    def initialize(player1_name, player2_name)
      @player1 = Player.new(player1_name)
      @player2 = Player.new(player2_name)
      @current_player = @player1
    end
  
    def switch_player
      @current_player = (@current_player == @player1) ? @player2 : @player1
    end
  
    def generate_question
      Question.new
    end

    def ask_question(question)
      puts "#{@current_player.name}: What does #{question.num1} plus #{question.num2} equal?"
      answer = gets.chomp.to_i
  
      if answer == question.answer
        puts "#{@current_player.name}: YES! You are correct."
      else
        puts "#{@current_player.name}: Seriously? No!"
        @current_player.lose_life
      end
    end
  
    def check_winner
      @player1.lives == 0 || @player2.lives == 0
    end
  
    def announce_winner
      winner = @player1.lives > 0 ? @player1 : @player2
      loser = winner == @player1 ? @player2 : @player1
      puts "#{winner.name} wins with a score of #{winner.lives}/3"
      puts "----- GAME OVER -----"
    end
  
    def play
      loop do
        question = generate_question
        ask_question(question)
        puts "P1: #{@player1.lives}/3 vs P2: #{@player2.lives}/3"
        break if check_winner
        switch_player
      end
      announce_winner
    end
  end