class MasterMind
#Written by Jeremy Herzberg; jeremy.herzberg@gmail.com; www.jeremyherzberg.com
#MasterMind algorithm derived by notable researchers (https://en.wikipedia.org/wiki/Mastermind_(board_game)#Algorithms)
#This algorithm works by first producing all permutations of possible answers and then eliminating possiablities based
#if the possibility produces the same peg result when tested against the guess as when the guess tested against the answer
#AFTER ALL, THE SOLUTION WILL PRODUCE THE SAME PEG RESULT WHEN TESTED AGAINST THE GUESS AS WHEN THE GUESS IS TESTED AGAINST THE SOLUTION

  attr_reader :number_of_guesses, :number_of_guesses,:hack_needed
  #set all attr_accessor to to att_reader upon deployment, set to accessor for testing only.. I will leave it like this for you
  attr_accessor :human_solution,:guess,:all_permutations

  def initialize(human_solution)

    @human_solution = human_solution
    @all_permutations = [1,2,3,4,5,6].repeated_permutation(4).to_a
    @guess = [1,1,2,2] #Knuth demonstrated this as the optimal starting guess
    @number_of_guesses = 1
  end

  #checks to see if a number in an array is a black_peg
  def is_Black_Peg?(guess,position)

    return @human_solution[position] == guess[position]

  end

  #checks to see if a number in an array is a white_peg
  def is_White_Peg?(guess,position)

    return @human_solution.count(guess[position]) > 0 && !is_Black_Peg?(guess,position)
  end

  #same as is_Black_peg? but uses guess as the answer
  def is_Black_Peg_against_guess?(guess,position)

    return @guess[position] == guess[position]
  end

  #same as is_White_peg? but uses guess as the answer
  def is_White_Peg_against_guess?(guess,position)

    return @guess.count(guess[position]) > 0 && !is_Black_Peg_against_guess?(guess,position)

  end

  #submits the @guess against the answer to get the peg result
  def read_pegs(guess)

    @pegs = {B: 0, W: 0}
    counted = []
    for x in 0..3
      if is_Black_Peg?(guess,x)
        @pegs[:B] += 1
        if counted.include?(guess[x])  && @pegs[:W] > 0 #a way to handle double counting of duplicates
          @pegs[:W] -= 1

        else counted.push(guess[x])

        end

      elsif is_White_Peg?(guess,x)

        if (@human_solution.count(guess[x]) < guess.count(guess[x])) && counted.count(guess[x] == 0)
          if counted.count(guess[x]) > 0;

          else @pegs[:W] += 1
          counted.push(guess[x])
          end

        else
          @pegs[:W] +=1
        end
      end
    end
    return @pegs
  end

  #submits the any guess against the @guess to get the peg result
  def read_pegs_against_guess(guess)
    pegs = {B: 0, W: 0}
    counted = []
    for x in 0..3
      if is_Black_Peg_against_guess?(guess,x)
        pegs[:B] += 1
        if counted.count(guess[x]) > 0 && pegs[:W] > 0 #a way to handle double counting of duplicates
          pegs[:W] -= 1

        else counted.push(guess[x])
        end

      elsif is_White_Peg_against_guess?(guess,x)

        if @guess.count(guess[x]) < guess.count(guess[x]) && counted.count(guess[x] == 0)
          if counted.count(guess[x]) > 0;

          else pegs[:W] += 1
          counted.push(guess[x])
          end

        else
          pegs[:W] +=1
        end
      end
    end
    return pegs
  end

  def guess_solution
    @hack_needed = false
    all_permutations = @all_permutations

    begin

      @number_of_guesses +=1
      all_permutations = all_permutations.select {|x| read_pegs_against_guess(x) == read_pegs(@guess)}

      #after extensive testing it appears that this hack is needed 4.5-5% (4,871/100,000) of the time to avoid an inf loop
      #I think there is a seeding issue with the RNG and I am not sure how to fix it
      #this block just restarts the guessing process, no information is passed from any previous runs

      if all_permutations.empty?
        all_permutations = @all_permutations
        @number_of_guesses = 1
        @guess = [1,1,2,2]
        @hack_needed = true
      end


      @guess = all_permutations[rand(all_permutations.length).to_i]

    end while @guess != @human_solution



  end

end
