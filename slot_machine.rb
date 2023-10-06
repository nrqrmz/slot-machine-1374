class SlotMachine
  SYMBOLS = %w[cherry seven bell star joker].freeze

  def initialize(reels = [])
    @reels = reels
  end

  def play
    @reels = []

    3.times do
      @reels << SYMBOLS.sample
    end

    @reels
  end

  def score
    if three_identical?
      base_score(@reels[0]) * 10
    elsif two_identical_and_at_least_a_joker?
      base_score(@reels.sort[1]) * 5
    else
      0
    end
  end

  private

  def three_identical?
    @reels.uniq.count == 1
  end

  def two_identical_and_at_least_a_joker?
    @reels.uniq.count == 2 && @reels.include?('joker')
  end

  def base_score(symbol)
    SYMBOLS.index(symbol) + 1
  end
end
