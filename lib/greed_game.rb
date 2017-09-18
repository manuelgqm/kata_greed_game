DICESET_SIZE = 5

class Game
  attr_accessor :players

  def initialize
    @players = []
  end

  def num_players
    @players.length
  end

  def add_players(*players)
    players.each { |player| @players << player }
  end

  def ready?
    @players.length > 1
  end
end

class Player
  attr_accessor :total_score
  attr_accessor :turns

  def initialize
    @total_score = 0
  end

  def add_score(*scores)
    @total_score = scores.inject { |sum, score| sum + score }
  end

end

class DiceCollection
  attr_accessor :values

  def roll(size=5)
    @values = Array.new(size).map { |item| 1 + rand(6)}
  end

  def score(dice=@values)
    to_points = lambda do |value, numbers=nil|
      if numbers == :tok
        return value == 1 ? 1000 : 100 * value
      end
      points = 0
      points = 50 if value == 5
      points = 100 if value == 1
      return points
    end

    remove_tok = lambda do |dice, value|
      3.times do
        value_index = dice.index(value)
        dice.delete_at(value_index)
      end
      dice
    end

    tok_find = lambda do |dice|
      dice.each do |item|
        if dice.count(item) > 2
          return item
        end
      end
      nil
    end

    total = 0
    tok = tok_find.call(dice)
    if tok
      total = to_points.call(tok, :tok)
      dice = remove_tok.call(dice, tok)
    end

    total += dice.inject(0) do |sum, item|
      sum + to_points.call(item)
    end

    return total
  end
end
