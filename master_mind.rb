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


  def read_pegs(guess, solution)

  pegs = {B: 0, W: 0}
  accounting_array = [0,0,0,0,0,0,0] #positions 1-6 in this array correspond to each possiable number in a solution, position 0 is used to hold values that shouldn't be counted per the rules of mastermind
  guess_copy = guess.dup

  #this loop assigns black pegs and adds remaining pegs to the solution array
  solution.each_index { |x|


    if guess_copy[x] == solution[x] #this is a black peg
       pegs[:B] += 1
       guess_copy[x] = 0 #to make sure we don't count this value again in the next loop


    else #else update the accounting array
      accounting_array[solution[x]] += 1

     end
  }

  #this loop assigns white pegs by finding entries
  guess_copy.each_index { |x|

    if accounting_array[guess_copy[x]] != 0 #check 

      accounting_array[guess_copy[x]] -= 1

      pegs[:W] += 1

    end
  }

  return pegs

  end

  def guess_solution
    @number_of_guesses = 1
    all_permutations = [1,2,3,4,5,6].repeated_permutation(4).to_a

    until read_pegs(@guess,@human_solution) == {B:4, W:0}

      all_permutations = all_permutations.select {|x| read_pegs(x,@guess) == read_pegs(@guess,@human_solution)}


      @guess = all_permutations.sample
      @number_of_guesses += 1

    end
  end
end


