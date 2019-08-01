FactoryBot.define do
  factory :word do
    word { "apple" }
    parts_of_speech { "名詞" }
    meaning { "りんご" }
    example { "I ate apple." }
  end
end
