require 'test/unit'
require './master_mind'
require './master_mind_app_helper'

class MyTest < Test::Unit::TestCase

  # Called before every test method runs. Can be used
  # to set up fixture information.
  def setup
    @mm = MasterMind.new([1,2,2,4])
  end

  # Called after every test method runs. Can be used to tear
  # down fixture information.


  def test_black_peg_assignment

    guess = [4,5,2,1]
    assert_false @mm.is_black_peg?(guess,0,@mm.human_solution)
    assert_false @mm.is_black_peg?(guess,1,@mm.human_solution)
    assert_true @mm.is_black_peg?(guess,2,@mm.human_solution)
    assert_false @mm.is_black_peg?(guess,3,@mm.human_solution)

    guess2 = [1,1,4,4]
    assert_true @mm.is_black_peg?(guess2,0,@mm.human_solution)
    assert_false @mm.is_black_peg?(guess2,1,@mm.human_solution)
    assert_false @mm.is_black_peg?(guess2,2,@mm.human_solution)
    assert_true @mm.is_black_peg?(guess2,3,@mm.human_solution)


    guess3 = [1,2,2,2]
    assert_true @mm.is_black_peg?(guess3,0,@mm.human_solution)
    assert_true @mm.is_black_peg?(guess3,1,@mm.human_solution)
    assert_true @mm.is_black_peg?(guess3,2,@mm.human_solution)
    assert_false @mm.is_black_peg?(guess3,3,@mm.human_solution)

  end



  def test_white_peg_assignment
    human_solution = @mm.human_solution
    guess = [2,5,4,1]
    assert_true @mm.is_white_peg?(human_solution,guess,0)
    assert_true @mm.is_white_peg?(human_solution,guess,2)
    assert_false @mm.is_white_peg?(human_solution,guess,1)

    guess = [2,4,1,2]
    assert_true @mm.is_white_peg?(human_solution,guess,0)
    assert_true @mm.is_white_peg?(human_solution,guess,1)
    assert_true @mm.is_white_peg?(human_solution,guess,2)
    assert_true @mm.is_white_peg?(human_solution,guess,3)
  end


  def test_read_peg_from_guess_only_black

    @mm.human_solution = [1,2,2,4]
    guess = [1,2,2,4]
    guess2 = [1,2,4,4]
    guess3 = [6,2,2,3]
    guess4 = [6,4,5,4]


    peg_return_from_guess = {B: 4, W: 0}
    peg_return_from_guess2 = {B: 3, W: 0}
    peg_return_from_guess3 = {B: 2, W: 0}
    peg_return_from_guess4 = {B: 1, W: 0}

    assert_equal @mm.read_pegs(guess, @mm.human_solution), peg_return_from_guess
    assert_equal @mm.read_pegs(guess2,@mm.human_solution), peg_return_from_guess2
    assert_equal @mm.read_pegs(guess3,@mm.human_solution), peg_return_from_guess3
    assert_equal @mm.read_pegs(guess4,@mm.human_solution), peg_return_from_guess4
  end

  def test_read_peg_1_black
    @mm.human_solution = [4,3,2,5]
    guess = [4,2,5,3]
    guess2 = [2,3,5,6]
    guess3 = [1,3,4,6]


    peg_return_from_guess = {B: 1, W: 3}
    peg_return_from_guess2 = {B: 1, W: 2}
    peg_return_from_guess3 = {B: 1, W: 1}

    assert_equal @mm.read_pegs(guess,@mm.human_solution), peg_return_from_guess
    assert_equal @mm.read_pegs(guess2,@mm.human_solution), peg_return_from_guess2
    assert_equal @mm.read_pegs(guess3,@mm.human_solution), peg_return_from_guess3
  end

  def test_read_peg_2_black

    @mm.human_solution = [6,6,2,4]
    guess = [6,3,2,6]
    guess2 = [4,6,2,6]

    peg_return_from_guess = {B: 2, W: 1}
    peg_return_from_guess2 = {B: 2, W: 2}



    assert_equal @mm.read_pegs(guess,@mm.human_solution), peg_return_from_guess
    assert_equal @mm.read_pegs(guess2,@mm.human_solution), peg_return_from_guess2

  end

  def test_read_peg_only_white

    @mm.human_solution = [6,4,3,2]
    guess = [2,3,4,6]
    guess2 = [1,3,6,4]
    guess3 = [4,6,5,1]
    guess4 = [1,5,1,6]

    peg_return_from_guess = {B: 0, W: 4}
    peg_return_from_guess2 = {B: 0, W: 3}
    peg_return_from_guess3 = {B: 0, W: 2}
    peg_return_from_guess4 = {B: 0, W: 1}
    assert_equal @mm.read_pegs(guess,@mm.human_solution), peg_return_from_guess
    assert_equal @mm.read_pegs(guess2,@mm.human_solution), peg_return_from_guess2
    assert_equal @mm.read_pegs(guess3,@mm.human_solution), peg_return_from_guess3
    assert_equal @mm.read_pegs(guess4,@mm.human_solution), peg_return_from_guess4

  end

  def test_read_pegs_3_duplicate_numbers_in_guess

    @mm.human_solution = [2,2,2,1]
    guess25 = [2,5,5,5]
    peg_return_from_guess25 = {B: 1, W: 0}
    assert_equal @mm.read_pegs(guess25,@mm.human_solution), peg_return_from_guess25

    @mm.human_solution = [5,4,1,4]
    guess26 = [4,4,4,1]
    peg_return_from_guess26 = {B: 1, W: 2}
    assert_equal @mm.read_pegs(guess26,@mm.human_solution), peg_return_from_guess26

    @mm.human_solution = [1,6,2,4]
    guess27 = [2,4,2,2]
    peg_return_from_guess27 = {B: 1, W: 1}
    assert_equal @mm.read_pegs(guess27,@mm.human_solution), peg_return_from_guess27

  end


  def test_guess_solution

    @mm.human_solution.clear
    4.times {@mm.human_solution.push(rand(1..6))} #generate random solution
    @mm.guess_solution
    assert_true @mm.guess == @mm.human_solution
  end

  def test_guess_solution_x_times

  guess_counter = 0


    true_if_im_done_testing = true
    number_of_times_to_run = 10

  number_of_times_to_run.times do
      @mm.human_solution.clear
      4.times {@mm.human_solution.push(rand(1..6))} #generate random solution

      @mm.guess_solution
      print "Number of guesses > 10. Problem" if @mm.number_of_guesses >= 10
      true_if_im_done_testing = false if @mm.guess != @mm.human_solution
      guess_counter += @mm.number_of_guesses
      @mm.number_of_guesses = 1
    
    end
    print guess_counter
    assert_true true_if_im_done_testing
  end

  def test_is_valid_number
    master_mind_app_helper = MasterMindAppHelper.new

    input = "g"
    assert_true master_mind_app_helper.is_valid_input?(input)
    input = "q"
    assert_true master_mind_app_helper.is_valid_input?(input)
    input = "12345"
    assert_false master_mind_app_helper.is_valid_input?(input)

  end
end
