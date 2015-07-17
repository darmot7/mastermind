class MasterMindAPP
require './master_mind'
#master_mind_app class, comment lines 91 and 90 to test using master_mind_test.rb

  def run

    human_solution = []
    puts 'Please Input the Solution. The solution will consist of 4 colors. Your Color choices are (R)ed, (G)reen, (O)range, (Y)ellow, (B)lue, (P)urple'

    #loop to populate the human_solution
    4.times { |x|
      puts 'What is color  #'  + (x+1).to_s + '?'

      input = gets.chomp
      input.downcase

      #loops until a vaild input is entered
      until is_valid_input?(input)

        input.clear
        puts 'Please try your input again, or enter Q to quit'
        input = gets.chomp
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

      print "I've guessed your solution and it is: " + computer_answer.to_s + ' and it took ' + mm.number_of_guesses.to_s + " guesses. \n "

    else
      print "Quitting.....Have a nice day! \n"
    end
  end

  def convert_from_color_to_num(color_array)
    number_array = []
    color_array.each {|x|

      number_array.push(1) if x == "r"
      number_array.push(2) if x == "g"
      number_array.push(3) if x == "o"
      number_array.push(4) if x == "y"
      number_array.push(5) if x == "b"
      number_array.push(6) if x == "p"
    }
    return number_array
  end

  def convert_from_num_to_color(number_array)
    color_array = []
    number_array.each {|x|
      color_array.push("R") if x == 1
      color_array.push("G") if x == 2
      color_array.push("O") if x == 3
      color_array.push("Y") if x == 4
      color_array.push("B") if x == 5
      color_array.push("P") if x == 6
    }
      return color_array
  end


  def is_valid_input?(input)
    acceptable_inputs = ["r","g","o","y","b","p","q"]
    return acceptable_inputs.include?(input[0].downcase)
  end

end

master_mind_app = MasterMindAPP.new
master_mind_app.run
