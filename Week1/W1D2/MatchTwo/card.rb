class Card
  FACES = [:hidden, :revealed]

  attr_accessor :face, :card_value

  def initialize(card_val = 'a')
    @card_value = card_val
    @face = FACES[0]
  end
  #
  # def self.random_card
  #   CARD_SET[rand(CARD_SET.length)]
  # end

  def ==(cmp)
    @card_value == cmp.card_value
  end

  def to_s
    @card_value
  end

  def hide
    @face = :hidden if @face == :revealed
  end

  def reveal
    @face = :revealed if @face == :hidden
  end

end
