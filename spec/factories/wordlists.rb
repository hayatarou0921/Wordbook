FactoryBot.define do
  factory :wordlist do
    sequence(:id) { |n| n }
    title { 'WordBook' }

    trait :invalid do
      title { nil }
    end
  end

  factory :apple do
    sequence(:id) { 1 }
    title { 'AppleBook' }
  end
  factory :orange do
    sequence(:id) { |n| n }
    title { 'OrangeBook' }
  end
end