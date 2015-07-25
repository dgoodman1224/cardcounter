class Deck
	attr_reader :cards

	def initialize
		@cards = []
		create_standard_deck
	end

	def create_standard_deck
		card_values = {'2' => 2,'3' => 3,'4' => 4,'5' => 5,'6' => 6,'7' => 7,'8' => 8,
						'9' => 9,'10' => 10,'J' => 10,'Q' => 10,'K' => 10,
						'A' => 11}
		suits = ['S', 'D', 'C', 'H']
		suits.each do |suit|
			card_values.each do |rank, value|
				card = Card.new(rank, value, suit)
				@cards.push(card)
			end
		end
	end
end

class Card

	attr_reader  :rank,  :suit, :value

	def initialize(rank, value, suit)
		@value = value
		@rank = rank
		@suit = suit
	end
end