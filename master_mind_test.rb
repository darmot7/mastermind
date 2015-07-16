require 'test/unit'
require './master_mind'

class MyTest < Test::Unit::TestCase

  # Called before every test method runs. Can be used
  # to set up fixture information.
  def setup
    human_solution = [1,2,2,4]
    @mm = MasterMind.new(human_solution)
  end

  # Called after every test method runs. Can be used to tear
  # down fixture information.

  def teardown
    # Do nothing
  end


  def test_black_peg_assignment
    guess = [4,5,2,1]
    assert_false @mm.is_Black_Peg?(guess,0)
    assert_false @mm.is_Black_Peg?(guess,1)
    assert_true @mm.is_Black_Peg?(guess,2)
    assert_false @mm.is_Black_Peg?(guess,3)

    guess2 = [1,1,1,1]
    assert_true @mm.is_Black_Peg?(guess2,0)
    assert_false @mm.is_Black_Peg?(guess2,1)
    assert_false @mm.is_Black_Peg?(guess2,2)
    assert_false @mm.is_Black_Peg?(guess2,3)

  end

  def test_white_peg_assignment
    guess = [2,5,4,1]
    assert_true @mm.is_White_Peg?(guess,0)
    assert_true @mm.is_White_Peg?(guess,2)
    assert_false @mm.is_White_Peg?(guess,1)

    guess = [2,4,1,2]
    assert_true @mm.is_White_Peg?(guess,0)
    assert_true @mm.is_White_Peg?(guess,1)
    assert_true @mm.is_White_Peg?(guess,2)
    assert_true @mm.is_White_Peg?(guess,3)
  end

  def test_find_repeted_numbers
    guess = [2,3,2,4]
    guess2 = [2,3,4,5]
    assert_true @mm.is_Repeated_in_Guess?(guess,guess[0])
    assert_false @mm.is_Repeated_in_Guess?(guess2,guess[0])
  end

  def test_return_peg_from_guess
    #human_solution = [1,2,2,4]
    guess = [1,2,2,2]
    guess2 = [1,1,4,4]
    guess3 = [6,5,4,3]
    guess4 = [1,2,2,4]
    guess5 = [2,4,1,2]
    guess6 = [2,2,2,4]
    guess7 = [2,1,4,2]
    guess8 = [2,2,4,1]
    guess9 = [2,4,6,3]

    peg_return_from_guess = {B: 3, W: 0}
    peg_return_from_guess2 = {B: 2, W: 0}
    peg_return_from_guess3 = {B: 0, W: 1}
    peg_return_from_guess4 = {B: 4, W: 0}
    peg_return_from_guess5 = {B: 0, W: 4}
    peg_return_from_guess6 = {B: 3, W: 0}
    peg_return_from_guess7 = {B: 0, W: 4}
    peg_return_from_guess8 = {B: 1, W: 3}
    peg_return_from_guess9 = {B: 0, W: 2}

    assert_equal @mm.read_pegs(guess), peg_return_from_guess
    assert_equal @mm.read_pegs(guess2), peg_return_from_guess2
    assert_equal @mm.read_pegs(guess3), peg_return_from_guess3
    assert_equal @mm.read_pegs(guess4), peg_return_from_guess4
    assert_equal @mm.read_pegs(guess5), peg_return_from_guess5
    assert_equal @mm.read_pegs(guess6), peg_return_from_guess6
    assert_equal @mm.read_pegs(guess7), peg_return_from_guess7
    assert_equal @mm.read_pegs(guess8), peg_return_from_guess8
    assert_equal @mm.read_pegs(guess9), peg_return_from_guess9
  #create more tests using a new human solution

    @mm.human_solution = [6,4,3,2]
    guess10 = [6,4,3,2]
    guess11 = [6,4,3,1]
    guess12 = [1,1,3,2]
    guess13 = [6,6,6,6]
    guess14 = [2,3,4,6]
    guess15 = [1,3,6,4]
    guess16 = [4,3,5,1]
    guess17 = [1,1,3,6]
    guess18 = [3,4,6,2]
    guess19 = [6,4,2,1]

    peg_return_from_guess10 = {B: 4, W: 0}
    peg_return_from_guess11 = {B: 3, W: 0}
    peg_return_from_guess12 = {B: 2, W: 0}
    peg_return_from_guess13 = {B: 1, W: 0}
    peg_return_from_guess14 = {B: 0, W: 4}
    peg_return_from_guess15 = {B: 0, W: 3}
    peg_return_from_guess16 = {B: 0, W: 2}
    peg_return_from_guess17 = {B: 1, W: 1}
    peg_return_from_guess18 = {B: 2, W: 2}
    peg_return_from_guess19 = {B: 2, W: 1}

    assert_equal @mm.read_pegs(guess10), peg_return_from_guess10
    assert_equal @mm.read_pegs(guess11), peg_return_from_guess11
    assert_equal @mm.read_pegs(guess12), peg_return_from_guess12
    assert_equal @mm.read_pegs(guess13), peg_return_from_guess13
    assert_equal @mm.read_pegs(guess14), peg_return_from_guess14
    assert_equal @mm.read_pegs(guess15), peg_return_from_guess15
    assert_equal @mm.read_pegs(guess16), peg_return_from_guess16
    assert_equal @mm.read_pegs(guess17), peg_return_from_guess17
    assert_equal @mm.read_pegs(guess18), peg_return_from_guess18
    assert_equal @mm.read_pegs(guess19), peg_return_from_guess19

    @mm.human_solution = [1,2,3,4]
    guess20 = [1,1,2,2]
    peg_return_from_guess20 = {B:1,W:1}
    assert_equal @mm.read_pegs(guess20), peg_return_from_guess20

  end

  def test_return_peg_from_guess_against_guess
    @mm.guess = [1,2,2,4]
    guess = [1,2,2,2]
    guess2 = [1,1,4,4]
    guess3 = [6,5,4,3]
    guess4 = [1,2,2,4]
    guess5 = [2,4,1,2]
    guess6 = [2,2,2,4]
    guess7 = [2,1,4,2]
    guess8 = [2,2,4,1]
    guess9 = [2,4,6,3]

    peg_return_from_guess = {B: 3, W: 0}
    peg_return_from_guess2 = {B: 2, W: 0}
    peg_return_from_guess3 = {B: 0, W: 1}
    peg_return_from_guess4 = {B: 4, W: 0}
    peg_return_from_guess5 = {B: 0, W: 4}
    peg_return_from_guess6 = {B: 3, W: 0}
    peg_return_from_guess7 = {B: 0, W: 4}
    peg_return_from_guess8 = {B: 1, W: 3}
    peg_return_from_guess9 = {B: 0, W: 2}

    assert_equal @mm.read_pegs_against_guess(guess), peg_return_from_guess
    assert_equal @mm.read_pegs_against_guess(guess2), peg_return_from_guess2
    assert_equal @mm.read_pegs_against_guess(guess3), peg_return_from_guess3
    assert_equal @mm.read_pegs_against_guess(guess4), peg_return_from_guess4
    assert_equal @mm.read_pegs_against_guess(guess5), peg_return_from_guess5
    assert_equal @mm.read_pegs_against_guess(guess6), peg_return_from_guess6
    assert_equal @mm.read_pegs_against_guess(guess7), peg_return_from_guess7
    assert_equal @mm.read_pegs_against_guess(guess8), peg_return_from_guess8
    assert_equal @mm.read_pegs_against_guess(guess9), peg_return_from_guess9
    #create more tests using a new human solution

    @mm.guess = [6,4,3,2]
    guess10 = [6,4,3,2]
    guess11 = [6,4,3,1]
    guess12 = [1,1,3,2]
    guess13 = [6,6,6,6]
    guess14 = [2,3,4,6]
    guess15 = [1,3,6,4]
    guess16 = [4,3,5,1]
    guess17 = [1,1,3,6]
    guess18 = [3,4,6,2]
    guess19 = [6,4,2,1]

    peg_return_from_guess10 = {B: 4, W: 0}
    peg_return_from_guess11 = {B: 3, W: 0}
    peg_return_from_guess12 = {B: 2, W: 0}
    peg_return_from_guess13 = {B: 1, W: 0}
    peg_return_from_guess14 = {B: 0, W: 4}
    peg_return_from_guess15 = {B: 0, W: 3}
    peg_return_from_guess16 = {B: 0, W: 2}
    peg_return_from_guess17 = {B: 1, W: 1}
    peg_return_from_guess18 = {B: 2, W: 2}
    peg_return_from_guess19 = {B: 2, W: 1}

    assert_equal @mm.read_pegs_against_guess(guess10), peg_return_from_guess10
    assert_equal @mm.read_pegs_against_guess(guess11), peg_return_from_guess11
    assert_equal @mm.read_pegs_against_guess(guess12), peg_return_from_guess12
    assert_equal @mm.read_pegs_against_guess(guess13), peg_return_from_guess13
    assert_equal @mm.read_pegs_against_guess(guess14), peg_return_from_guess14
    assert_equal @mm.read_pegs_against_guess(guess15), peg_return_from_guess15
    assert_equal @mm.read_pegs_against_guess(guess16), peg_return_from_guess16
    assert_equal @mm.read_pegs_against_guess(guess17), peg_return_from_guess17
    assert_equal @mm.read_pegs_against_guess(guess18), peg_return_from_guess18
    assert_equal @mm.read_pegs_against_guess(guess19), peg_return_from_guess19

    @mm.guess = [1,1,2,2]
    guess20 = [1,2,3,4]
    peg_return_from_guess20 = {B:1,W:1}
    assert_equal @mm.read_pegs_against_guess(guess20), peg_return_from_guess20

  end

  def test_is_correct
    guess = [1,2,2,4]
    assert_true @mm.is_correct?(guess)
  end

  def test_guess_solution
  test_success = true

    @mm.human_solution.clear
    4.times {@mm.human_solution.push(rand(1..6))}
    @mm.guess_solution
   assert_true @mm.guess == @mm.human_solution
  end

  def test_test_is_correct
    assert_true @mm.test_is_correct
  end

  def test_sum_of_pegs
    @mm.guess = [1,1,4,4]
    peg_return_from_guess2 = {B: 2, W: 0}
    assert_equal @mm.sum_of_pegs(mm.guess),2
  end

end
