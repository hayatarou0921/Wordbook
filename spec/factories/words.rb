FactoryBot.define do
  factory :word, class: 'Word' do
    word { "apple" }
    parts_of_speech { "名詞" }
    meaning { "りんご" }
    example { "I ate apple." }
  end
  factory :banana, class: 'Word' do
    word { "banana" }
    parts_of_speech { "名詞" }
    meaning { "バナナ" }
    example { "I ate banana." }
  end
end
