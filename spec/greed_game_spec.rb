require "greed_game"

describe 'Game' do
  describe "is ready" do
    it 'has two players' do
      game = Game.new()
      player_one = {}
      player_two = {}
      game.add_players(player_one, player_two)
      expect(game.num_players).to eq(2)
    end
  end
  describe 'is not ready' do
    it 'has no players' do
      game = Game.new()
      expect(game.num_players).to eq(0)
    end
    
  end
end

# class AboutDiceCollection < Neo::Koan
#   @@DiceCollection = DiceCollection.new

#   def test_score_of_an_empty_list_is_zero
#     @@diceCollection = DiceCollection.new
#     assert_equal 0, @@diceCollection.score([])
#   end

#   def test_score_of_a_single_roll_of_5_is_50
#     assert_equal 50, @@diceCollection.score([5])
#   end

#   def test_score_of_a_single_roll_of_1_is_100
#     assert_equal 100, @@diceCollection.score([1])
#   end

#   def test_score_of_multiple_1s_and_5s_is_the_sum_of_individual_scores
#     assert_equal 300, @@diceCollection.score([1,5,5,1])
#   end

#   def test_score_of_single_2s_3s_4s_and_6s_are_zero
#     assert_equal 0, @@diceCollection.score([2,3,4,6])
#   end

#   def test_score_of_a_triple_1_is_1000
#     assert_equal 1000, @@diceCollection.score([1,1,1])
#   end

#   def test_score_of_other_triples_is_100x
#     assert_equal 200, @@diceCollection.score([2,2,2])
#     assert_equal 300, @@diceCollection.score([3,3,3])
#     assert_equal 400, @@diceCollection.score([4,4,4])
#     assert_equal 500, @@diceCollection.score([5,5,5])
#     assert_equal 600, @@diceCollection.score([6,6,6])
#   end

#   def test_score_of_mixed_is_sum
#     assert_equal 250, @@diceCollection.score([2,5,2,2,3])
#     assert_equal 550, @@diceCollection.score([5,5,5,5])
#     assert_equal 1100, @@diceCollection.score([1,1,1,1])
#     assert_equal 1200, @@diceCollection.score([1,1,1,1,1])
#     assert_equal 1150, @@diceCollection.score([1,1,1,5,1])
#   end

#   def test_scored_dices_are_removed_from_set
    
#   end
# end