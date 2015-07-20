require 'test/unit'
require './master_mind'
require './master_mind_app'

class MyTest < Test::Unit::TestCase

  # Called before every test method runs. Can be used
  # to set up fixture information.
  def setup
    human_solution = [1,2,2,4]
    @mm = MasterMind.new(human_solution)
    @mmaster_mind_app = MasterMindAPP.new
  end

  # Called after every test method runs. Can be used to tear
  # down fixture information.


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

  def test_black_peg_against_guess
    guess = [4,5,2,1]
    @mm.guess = @mm.human_solution
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

  def test_white_peg_assignment_against_guess
    guess = [2,5,4,1]
    @mm.guess = @mm.human_solution
    assert_true @mm.is_White_Peg_against_guess?(guess,0)
    assert_true @mm.is_White_Peg_against_guess?(guess,2)
    assert_false @mm.is_White_Peg_against_guess?(guess,1)

    guess = [2,4,1,2]
    assert_true @mm.is_White_Peg_against_guess?(guess,0)
    assert_true @mm.is_White_Peg_against_guess?(guess,1)
    assert_true @mm.is_White_Peg_against_guess?(guess,2)
    assert_true @mm.is_White_Peg_against_guess?(guess,3)
  end

  def test_read_peg_from_guess
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

    @mm.human_solution = [6,4,3,2]
    guess22 = [1,1,2,2]
    guess23 = [1,3,1,1]
    peg_return_from_guess22 = {B: 1, W: 0}
    peg_return_from_guess23 = {B: 0, W: 1}
    assert_equal @mm.read_pegs(guess22), peg_return_from_guess22
    assert_equal @mm.read_pegs(guess23), peg_return_from_guess23

  end

  def test_read_peg_from_guess_against_guess
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

    @mm.guess = [4,1,4,4]
    guess20 = [1,2,3,4]
    guess21 = [1,1,2,4]
    peg_return_from_guess20 = {B:1,W:1}
    peg_return_from_guess21 = {B:2,W:0}
    assert_equal @mm.read_pegs_against_guess(guess20), peg_return_from_guess20
    assert_equal @mm.read_pegs_against_guess(guess21), peg_return_from_guess21

    @mm.guess = [6,4,3,2]
    guess22 = [1,1,2,2]
    guess23 = [1,3,1,1]
    peg_return_from_guess22 = {B: 1, W: 0}
    peg_return_from_guess23 = {B: 0, W: 1}
    assert_equal @mm.read_pegs_against_guess(guess22), peg_return_from_guess22
    assert_equal @mm.read_pegs_against_guess(guess23), peg_return_from_guess23


  end

  def test_guess_solution

    @mm.human_solution.clear
    4.times {@mm.human_solution.push(rand(1..6))}
    @mm.guess_solution
    assert_true @mm.guess == @mm.human_solution

  end

  def test_guess_solution_x_times

    permutation_holder = @mm.all_permutations
    true_if_im_done_testing = true
    hack_counter = 0

    10000.times do
      @mm.human_solution.clear
      4.times {@mm.human_solution.push(rand(1..6))}

      @mm.guess_solution
      puts @mm.number_of_guesses if @mm.number_of_guesses >= 10
      #workaround_counter += 1 if @mm.hack_needed == true #used to determine when the workaround is used

      true_if_im_done_testing = false if @mm.guess != @mm.human_solution
      @mm.all_permutations = permutation_holder #so we don't have to keep recalculating this
      @mm.number_of_guesses = 1


    end
    puts @mm.number_of_workarounds_used
    assert_true true_if_im_done_testing
  end

  def test_is_valid_number
    input = "g"
    assert_true @master_mind_app.is_valid_input?(input)
    input = "q"
    assert_false @master_mind_app.is_valid_input?(input)
    input = "12345"
    assert_false @master_mind_app.is_valid_input?(input)

  end
end
