# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# デフォルトユーザー
User.create(
  email: 'test@example.com',
  password: 'password', 
  password_confirmation: 'password'
)
#デフォルト単語帳
Wordlist.create(
  user_id: 1,
  title: '日常単語'
)
Wordlist.create(
  user_id: 1,
  title: 'TOEFUL単語'
)

#デフォルト単語帳１
Word.create(
  word: 'firework',
  meaning: '花火',
  parts_of_speech: '名詞',
  example: 'Fireworks are launched to the sky in the Summer Festival.',
  wordlist_id: '1'
)
Word.create(
  word: 'wounded',
  meaning: '負傷した',
  parts_of_speech: '形容詞',
  example: 'Many people were wounded in the accident.',
  wordlist_id: '1'
)
Word.create(
  word: 'aisle',
  meaning: '通路',
  parts_of_speech: '名詞',
  example: 'The aisle was covered with rubble',
  wordlist_id: '1'
)
Word.create(
  word: 'without',
  meaning: '...なしで',
  parts_of_speech: '前置詞',
  example: 'We completed a misson without him.',
  wordlist_id: '1'
)
Word.create(
  word: 'pleed',
  meaning: '請願する',
  parts_of_speech: '動詞',
  example: 'The man pleeded for mercy.',
  wordlist_id: '1'
)
Word.create(
  word: 'no longer',
  meaning: 'もはや...ない',
  parts_of_speech: '副詞',
  example: 'He is no longer stay here.',
  wordlist_id: '1'
)
Word.create(
  word: 'protest',
  meaning: '抗議する',
  parts_of_speech: '動詞',
  example: 'The pro-choice group protested against a ban of on abortion',
  wordlist_id: '1'
)
Word.create(
  word: 'ally',
  meaning: '同盟国',
  parts_of_speech: '名詞',
  example: 'The allies condemned tha invasion.',
  wordlist_id: '1'
)
60.times do |i|
  ps = ['名詞','動詞','形容詞','副詞','前置詞','接続詞','感動詞']
  Word.create(
    word: "test word#{i}",
    meaning: "テスト単語#{i}",
    parts_of_speech: ps[i%7],
    example: 'This word is just a example.',
    wordlist_id: '1'
  )
end

#デフォルト単語(単語帳2)
Word.create(
  word: 'coral',
  meaning: 'サンゴ',
  parts_of_speech: '名詞',
  example: 'Corals are beautiful.',
  wordlist_id: '2'
)
Word.create(
  word: 'hibernate',
  meaning: '冬眠する',
  parts_of_speech: '動詞',
  example: 'The bear in this area hibernated.',
  wordlist_id: '2'
)
Word.create(
  word: 'nocturnal',
  meaning: '夜行性の',
  parts_of_speech: '形容詞',
  example: 'The owl is nocturnal.',
  wordlist_id: '2'
)
Word.create(
  word: 'propagate',
  meaning: '増殖する',
  parts_of_speech: '動詞',
  example: 'The virus propagetes.',
  wordlist_id: '2'
)
Word.create(
  word: 'tumor',
  meaning: '腫瘍',
  parts_of_speech: '名詞',
  example: 'My grandma has a tumor in her brain.',
  wordlist_id: '2'
)
Word.create(
  word: 'cognitive',
  meaning: '認識の',
  parts_of_speech: '形容詞',
  example: 'He doesn\'t have cognitive ability',
  wordlist_id: '2'
)
Word.create(
  word: 'cylindrical ',
  meaning: '円筒の',
  parts_of_speech: '形容詞',
  example: 'Please bring cylindrical water bottle.',
  wordlist_id: '2'
)
Word.create(
  word: 'harbivorous',
  meaning: '草食の',
  parts_of_speech: '形容詞',
  example: 'Goat is harbivorous.',
  wordlist_id: '2'
)
60.times do |i|
  ps = ['名詞','動詞','形容詞','副詞','前置詞','接続詞','感動詞']
  Word.create(
    word: "test word#{i}",
    meaning: "テスト単語#{i}",
    parts_of_speech: ps[i%7],
    example: 'This word is just a example.',
    wordlist_id: '2'
  )
end