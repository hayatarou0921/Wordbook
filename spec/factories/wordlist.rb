FactoryBot.define do
  factory :wordlist do
    sequence(:id) { |n| n }
    title { 'Book1' }
  end
end