class Game
attr_accessor :code

  def initialize(code)
    @code = code
    
  end

  def randomize()
    self.code = [rand(9)+1, rand(9)+1, rand(9)+1, rand(9)+1] #randomize 1-9
  end

  def self.get_player_choice()
    puts "Type in your guess separated by spaces (e.g. 1 3 5 4): "
    input = gets.chomp.split
    result = []
    input.each do |x|
      if !x.to_i.between?(1,9) 
        puts "Incorrect input. Try again"
        Game.get_player_choice()
        return
      else
        result << x.to_i
      end
    end
    return result
  end

  def check_choice(code_array, choice_array)
    
  end

  def game_loop()
    rounds = 0
    max_rounds = 12
    while rounds < max_rounds
      
      rounds += 1
    end
  end
end

g1 = Game.new([1,2,3,4])

# puts g1.code
# puts "\n"
# g1.randomize
# puts g1.code

Game.get_player_choice()
