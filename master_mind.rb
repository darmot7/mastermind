class MasterMind
attr_reader :number_of_guesses, :number_of_guesses
attr_accessor :human_solution,:guess #set to att_reader upon deployment, set to accessor for testing only

  def initialize(human_solution)

   @human_solution = human_solution
   @all_permutations = [1,2,3,4,5,6].repeated_permutation(4).to_a
   @guess = [1,1,2,2]
   @number_of_guesses = 1

  end

  def is_Black_Peg?(guess,position)

    return @human_solution[position] == guess[position]

  end

  def is_White_Peg?(guess,position)

    return @human_solution.count(guess[position]) > 0 && !is_Black_Peg?(guess,position)
  end

  def is_Black_Peg_against_guess?(guess,position)

    return @guess[position] == guess[position]
end

  def is_White_Peg_against_guess?(guess,position)

  return @guess.count(guess[position]) > 0 && !is_Black_Peg_against_guess?(guess,position)

end

  def is_Repeated_in_Guess?(guess,x)

    return guess.count(guess[x]) > 1
  end # maybe not needed

  def read_pegs(guess)

    @pegs = {B: 0, W: 0}
    counted = []
    for x in 0..3
      if is_Black_Peg?(guess,x)
        @pegs[:B] += 1
        if counted.count(guess[x]) > 0 && @pegs[:W] > 0 #a way to handle double counting of duplicates
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
      end #check for unneeded logic

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

  def is_correct?(guess)
    return guess == @human_solution
  end

  def sum_of_pegs(guess)
    return read_pegs(guess).values.inject {|sum,x| sum + x}
  end

  def test_is_correct
    true_if_im_done = true
    100.times do
      4.times {@human_solution.push(rand(1..6))}
      @human_solution = [6,3,4,4]
      guess_solution
      true_if_im_done = false if @guess != @human_solution
      @all_permutations = [1,2,3,4,5,6].repeated_permutation(4).to_a
      @number_of_guesses =1
    end
    return true_if_im_done
  end

  def guess_solution
    #puts "this is the human solution: " + @human_solution + "\n"
    all_permutations = @all_permutations

    begin

      @number_of_guesses +=1
      all_permutations = all_permutations.select {|x| read_pegs_against_guess(x) == read_pegs(@guess)}

    @guess = all_permutations[rand(all_permutations.length)]
    end while @guess != @human_solution

    print @human_solution
    print @guess
    puts @number_of_guesses
  end

end




