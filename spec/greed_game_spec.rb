require "greed_game"

describe 'Game' do
  before(:each) do
    @game = Game.new()
  end

  describe "is ready when" do
    it 'has two players' do
      player_one = {}
      player_two = {}
      @game.add_players(player_one, player_two)
      expect(@game.ready?).to be_truthy
    end

    it 'has tree players' do
      player_one = {}
      player_two = {}
      player_three = {}
      @game.add_players(player_one, player_two, player_three)
      expect(@game.ready?).to be_truthy
    end
  end

  describe 'is not ready when' do
    it 'has no players' do
      expect(@game.ready?).to be_falsy
    end

    it 'has one player' do
      player_one = {}
      @game.add_players(player_one)
      expect(@game.ready?).to be_falsy
    end
  end
end

describe 'A player' do
  before(:each) do
    @player = Player.new()
  end

  it 'starts with zero score' do
    expect(@player.total_score).to eq(0)
  end

  it 'adds score by 10' do
    @player.add_score(10)
    expect(@player.total_score).to eq(10)
  end

  it 'adds score by 10 and 20' do
    @player.add_score(10, 20)
    expect(@player.total_score).to eq(30)
  end
end

describe 'A dice set' do
  before(:each) do
    @diceset = DiceCollection.new
  end

  describe 'that is rolled' do
    it 'rolls 5 dices by default' do
      @diceset.roll
      expect(@diceset.values.length).to eq(5)
    end

    it 'rolls passed number of dices' do
      @diceset.roll(6)
      expect(@diceset.values.length).to eq(6)
    end
  end

  describe 'scores on' do
    it 'no values is zero' do
      expect(@diceset.score([])).to eq(0)
    end

    it 'single roll of 5 is 50' do
      expect(@diceset.score([5])).to eq(50)
    end

    it 'single roll of 1 is 100' do
      expect(@diceset.score([1])).to eq(100)
    end

    it 'mutiple 1s and 5s is the sum of individual scores' do
      expect(@diceset.score([1,5,5,1])).to eq(300)
    end

    it 'single 2s, 3s, 4s, and 6s are zero' do
      expect(@diceset.score([2,3,4,6])).to eq(0)
    end

    it 'a triple 1 is 1000' do
      expect(@diceset.score([1,1,1])).to eq(1000)
    end

    it 'other triples is 100x' do
      expect(@diceset.score([2,2,2])).to eq(200)
      expect(@diceset.score([3,3,3])).to eq(300)
      expect(@diceset.score([4,4,4])).to eq(400)
      expect(@diceset.score([5,5,5])).to eq(500)
      expect(@diceset.score([6,6,6])).to eq(600)
    end

    it 'mixed is sum' do
      expect(@diceset.score([2,5,2,2,3])).to eq(250)
      expect(@diceset.score([5,5,5,5])).to eq(550)
      expect(@diceset.score([1,1,1,1])).to eq(1100)
      expect(@diceset.score([1,1,1,1,1])).to eq(1200)
      expect(@diceset.score([1,1,1,5,1])).to eq(1150)
    end

  end

  it 'returns number of not scored dices' do

  end
end
