FactoryBot.define do
  factory :wordlist do
    sequence(:id) { |n| n }
    name { 'My english wordbook' }
  end
end
