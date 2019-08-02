class Wordlist < ApplicationRecord
  validates :title, presence: true, uniqueness: true,
                    length: { maximum: 100 }

  has_many :words, dependent: :destroy
end
