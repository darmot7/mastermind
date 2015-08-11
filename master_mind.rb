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
    @guess = [1,1,2,2]
  end

  #this method uses an accounting system to read the pegs in O(n) time
  def read_pegs(guess, solution)

  pegs = {B: 0, W: 0}
  solution_array = [0,0,0,0,0,0,0] #in this array 0 means 0 so the 7th spot means 6
  guess_copy = guess.dup

  solution.each_index { |x|

    if guess_copy[x] == solution[x]
       pegs[:B] += 1
       guess_copy[x] = 0


    else
      solution_array[solution[x]] += 1

     end
  }

  guess_copy.each_index { |x|

    if solution_array[guess_copy[x]] != 0

      solution_array[guess_copy[x]] -= 1

      pegs[:W] += 1

    end
  }

  return pegs

  end

  def guess_solution
    @number_of_guesses = 1
    all_permutations = [1,2,3,4,5,6].repeated_permutation(4).to_a
    #@guess = [1,1,2,2] #Knuth demonstrated this as the optimal starting guess

    until read_pegs(@guess,@human_solution) == {B:4, W:0}

      all_permutations = all_permutations.select {|x| read_pegs(x,@guess) == read_pegs(@guess,@human_solution)}


      @guess = all_permutations.sample
      @number_of_guesses += 1

    end
  end
end


