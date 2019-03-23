class String
  def black;          "\e[30m#{self}\e[0m" end
  def red;            "\e[31m#{self}\e[0m" end
  def green;          "\e[32m#{self}\e[0m" end
  def brown;          "\e[33m#{self}\e[0m" end
  def blue;           "\e[34m#{self}\e[0m" end
  def magenta;        "\e[35m#{self}\e[0m" end
  def cyan;           "\e[36m#{self}\e[0m" end
  def gray;           "\e[37m#{self}\e[0m" end
  
  def bg_black;       "\e[40m#{self}\e[0m" end
  def bg_red;         "\e[41m#{self}\e[0m" end
  def bg_green;       "\e[42m#{self}\e[0m" end
  def bg_brown;       "\e[43m#{self}\e[0m" end
  def bg_blue;        "\e[44m#{self}\e[0m" end
  def bg_magenta;     "\e[45m#{self}\e[0m" end
  def bg_cyan;        "\e[46m#{self}\e[0m" end
  def bg_gray;        "\e[47m#{self}\e[0m" end
  
  def bold;           "\e[1m#{self}\e[22m" end
  def italic;         "\e[3m#{self}\e[23m" end
  def underline;      "\e[4m#{self}\e[24m" end
  def blink;          "\e[5m#{self}\e[25m" end
  def reverse_color;  "\e[7m#{self}\e[27m" end
  end
  

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
      if !x.to_i.between?(1,9) || input.length != 4
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
    result = []
    choice_array.each_with_index do |choice_val, choice_index|
      is_color = false
      code_array.each_with_index do |code_val, code_index|
        if code_val == choice_val
          if code_index == choice_index
            result << "r".red
            is_color = true
            next
          else
            result << "w"
            is_color = true
            next
          end
        end
      end
      is_color == false ? result << "-" : true
    end
    return result
  end

  def game_loop()
    puts "                 " + "MASTERMIND GAME".bg_magenta
    puts "     " + "Guess what code I am thinking of. Digits (1-9)".magenta
    puts "w" + " - digit is in code but not in this spot | ".magenta + "r".red + " - digit is in this spot".magenta

    round = 0
    max_rounds = 4
    self.randomize()
    while round < max_rounds
      print self.code 
      puts "\n"
      choice = Game.get_player_choice()
      colors = check_choice(self.code, choice)
      puts "#{colors[0]} #{colors[1]} #{colors[2]} #{colors[3]}"
      round += 1
    end
  end
end

g1 = Game.new([1,2,3,4])

# puts g1.code
# puts "\n"
# g1.randomize
# puts g1.code
g1.game_loop()