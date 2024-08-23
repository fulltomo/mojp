class Ranking < ApplicationRecord
  validates :player_name, presence: true
  validates :score, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :time, presence: true, numericality: { greater_than: 0 }
end
