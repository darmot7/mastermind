class MasterMindAppHelper
require './master_mind'

def initialize(size = 4)
  size = 4 if size != 4 #remove this for future implementation to make mastermind accept solutions of different sizes
  @solution_size = size
end

  def run

    human_solution = []
    puts 'Please Input the Solution. The solution will consist of 6 colors. Your Color choices are (R)ed, (G)reen, (O)range, (Y)ellow, (B)lue, (P)urple'

    #loop to populate the human_solution
    @solution_size.times { |x|
      puts 'What is color #'  + (x+1).to_s + '?'

      input = gets.chomp

      if input.nil? || input == ""
        input = " "
      end
      input.downcase
        #loops until a vaild input is entered

      until is_valid_input?(input)

        input.clear
        puts 'Please try your input again, or enter Q to quit'
        input = gets.chomp

        if input.nil? || input == ""
          input = " "
        end

      end

      #so entering Q makes the app quit
      if input[0].downcase == "q"
        human_solution.clear
        break
      end

      human_solution.push(input[0].downcase)
      print "Color Entered: " + input[0] + "\n"
      print human_solution.to_s + "\n"

    }

    if human_solution != [] #if human_solution = [] then we quit

      print 'your solution is: ' + human_solution.to_s.upcase + "\n"

      human_solution = convert_from_color_to_num(human_solution)

      mm = MasterMind.new(human_solution)

      mm.guess_solution

      computer_answer = convert_from_num_to_color(mm.guess)

      print "I've guessed your solution and it is: " + computer_answer.to_s + ', it took ' + mm.number_of_guesses.to_s + " guesses. \n "

    else
      print "Quitting.....Have a nice day! \n"
    end
  end

  def convert_from_color_to_num(color_array)
    number_array = Array.new(4)

    color_array.each_index {|x|

      number_array[x] = 1 if color_array[x] == "r"
      number_array[x] = 2 if color_array[x] == "g"
      number_array[x] = 3 if color_array[x] == "o"
      number_array[x] = 4 if color_array[x] == "y"
      number_array[x] = 5 if color_array[x] == "b"
      number_array[x] = 6 if color_array[x] == "p"
    }
    return number_array
  end

  def convert_from_num_to_color(number_array)
    color_array = Array.new(4)
    number_array.each_index  {|x|
      color_array[x] = "R" if number_array[x] == 1
      color_array[x] = "G" if number_array[x] == 2
      color_array[x] = "O" if number_array[x] == 3
      color_array[x] = "Y" if number_array[x] == 4
      color_array[x] = "B" if number_array[x] == 5
      color_array[x] = "P" if number_array[x] == 6
    }
      return color_array
  end


  def is_valid_input?(input)

    acceptable_inputs = ["r","g","o","y","b","p","q"]
    return acceptable_inputs.include?(input[0].downcase)
  end

end

