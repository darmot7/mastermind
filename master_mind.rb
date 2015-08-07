class MasterMind

  #Written by Jeremy Herzberg; jeremy.herzberg@gmail.com; www.jeremyherzberg.com
  #MasterMind algorithm derived by notable researchers (https://en.wikipedia.org/wiki/Mastermind_(board_game)#Algorithms)
  #This algorithm works by first producing all permutations of possible answers and then eliminating possiablities based
  #if the possibility produces the same peg result when tested against the guess as when the guess tested against the answer
  #AFTER ALL, THE SOLUTION WILL PRODUCE THE SAME PEG RESULT WHEN TESTED AGAINST THE GUESS AS WHEN THE GUESS IS TESTED AGAINST THE SOLUTION

  #set all attr_accessor to att_reader upon deployment, set to accessor for testing only.. I will leave it like this for you
  attr_accessor :human_solution,:guess,:number_of_guesses

  def initialize(human_solution)
    @human_solution = human_solution
  end

  #checks to see if a number in an array is a black_peg
  def is_Black_Peg?(guess,position,human_solution = @human_solution)

    return human_solution[position] == guess[position]

  end

  #checks to see if a number in an array is a white_peg
  def is_White_Peg?(human_solution, guess,position)

    return human_solution.count(guess[position]) > 0
  end

  #submits the @guess against the answer to get the peg result
  def read_pegs(guess, solution)

    pegs = {B: 0, W: 0}
    solution_duplicate = solution.dup
    guess_duplicate = guess.dup


    guess.each_index { |x|

       if is_Black_Peg?(guess, x, solution)
        pegs[:B] += 1
        solution_duplicate.delete_at(solution_duplicate.find_index(guess[x]))
        guess_duplicate.delete_at(guess_duplicate.find_index(guess[x]))

       end

    }

    guess_duplicate.each_index {|x| if is_White_Peg?(solution_duplicate,guess_duplicate,x)
                           pegs[:W] += 1
                           solution_duplicate.delete_at(solution_duplicate.find_index(guess_duplicate[x]))
                           end}


    return pegs
    end

  def guess_solution
    @number_of_guesses = 1
    all_permutations = [1,2,3,4,5,6].repeated_permutation(4).to_a
    @guess = [1,1,2,2] #Knuth demonstrated this as the optimal starting guess

    until read_pegs(@guess,@human_solution) == {B:4, W:0}

      #pegs_from_guess_against_solution = read_pegs(@guess,@human_solution) # so this doesn't have to be rerun during the next select

      all_permutations = all_permutations.select {|x| read_pegs(x,@guess) == read_pegs(@guess,@human_solution)}


      @guess = all_permutations.sample
      @number_of_guesses += 1

    end

  end

end
