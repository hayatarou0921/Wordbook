class Word < ApplicationRecord
  belongs_to :wordlist

  validates :word, presence: true, length: { maximum: 50 }
  validates :parts_of_speech, presence: true
  validates :meaning, presence: true
end
