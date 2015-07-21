class MasterMind
  # require 'debug'

  #Written by Jeremy Herzberg; jeremy.herzberg@gmail.com; www.jeremyherzberg.com
  #MasterMind algorithm derived by notable researchers (https://en.wikipedia.org/wiki/Mastermind_(board_game)#Algorithms)
  #This algorithm works by first producing all permutations of possible answers and then eliminating possiablities based
  #if the possibility produces the same peg result when tested against the guess as when the guess tested against the answer
  #AFTER ALL, THE SOLUTION WILL PRODUCE THE SAME PEG RESULT WHEN TESTED AGAINST THE GUESS AS WHEN THE GUESS IS TESTED AGAINST THE SOLUTION

  attr_reader :number_of_workarounds_used
  #set all attr_accessor to to att_reader upon deployment, set to accessor for testing only.. I will leave it like this for you
  attr_accessor :human_solution,:guess,:all_permutations, :number_of_guesses

  def initialize(human_solution)

    @human_solution = human_solution
    @all_permutations = [1,2,3,4,5,6].repeated_permutation(4).to_a
    @guess = [1,1,2,2] #Knuth demonstrated this as the optimal starting guess
    @number_of_guesses = 1
    @number_of_workarounds_used = 0
  end

  #checks to see if a number in an array is a black_peg
  def is_Black_Peg?(guess,position)

    return @human_solution[position] == guess[position]

  end

  #checks to see if a number in an array is a white_peg
  def is_White_Peg?(human_solution, guess,position)

    return human_solution.count(guess[position]) > 0 #&& !is_Black_Peg?(guess,position)
  end

  #same as is_Black_peg? but uses guess as the answer
  def is_Black_Peg_against_guess?(guess,position)

    return @guess[position] == guess[position]
  end

  #same as is_White_peg? but uses guess as the answer
  def is_White_Peg_against_guess?(guess,permutation,position)

    return guess.count(permutation[position]) > 0 #&& !is_Black_Peg_against_guess?(guess,position)

  end

  #submits the @guess against the answer to get the peg result
  def read_pegs(guess)

    @pegs = {B: 0, W: 0}
    human_solution = Array.new(@human_solution)
    guess_duplicate = Array.new(guess)


    guess.each_index { |x|

       if is_Black_Peg?(guess,x)
        @pegs[:B] += 1
        human_solution.delete_at(human_solution.find_index(guess[x]))
        guess_duplicate.delete_at(guess_duplicate.find_index(guess[x]))

       end

    }

    guess_duplicate.each_index {|x| if is_White_Peg?(human_solution,guess_duplicate,x)
                           @pegs[:W] += 1
                           human_solution.delete_at(human_solution.find_index(guess_duplicate[x]))
                           end}

    return @pegs
    end


  #submits the any guess against the @guess to get the peg result
  def read_pegs_against_guess(guess)

    @pegs = {B: 0, W: 0}
    permutation_in_series = Array.new(guess)
    guess_duplicate = Array.new(@guess)


    guess.each_index { |x|

      if is_Black_Peg_against_guess?(guess,x)
        @pegs[:B] += 1
        guess_duplicate.delete_at(guess_duplicate.find_index(guess[x]))
        permutation_in_series.delete_at(permutation_in_series.find_index(guess[x]))

      end

    }

    permutation_in_series.each_index {|x| if is_White_Peg_against_guess?(guess_duplicate,permutation_in_series,x)
                                      @pegs[:W] += 1
                                      guess_duplicate.delete_at(guess_duplicate.find_index(permutation_in_series[x]))
                                    end}
    return @pegs
  end

  def guess_solution
    @number_of_guesses = 1
    all_permutations = @all_permutations
    guess_set = []
    @guess = [1,1,2,2]

    until read_pegs(@guess) == {B:4, W:0}
      guess_set.push(@guess)

      all_permutations = all_permutations.select {|x| read_pegs_against_guess(x) == read_pegs(@guess)}


      @guess = all_permutations.sample
      @number_of_guesses += 1

    end
  end

end
