class Wordlist < ApplicationRecord
  validates :title, presence: true

  has_many :words, dependent: :destroy
end
