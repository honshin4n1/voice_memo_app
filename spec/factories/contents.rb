FactoryBot.define do

  factory :content do
    title        { Faker::Movie.title }
    comment      { Faker::Lorem.sentence }
    start_time   { Faker::Time.between(from: DateTime.now - 2, to: DateTime.now) }
    display      {0}
    created_at   { Faker::Time.between(from: DateTime.now - 2, to: DateTime.now) }
    association :genre
    association :user
  end

end