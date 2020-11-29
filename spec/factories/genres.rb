FactoryBot.define do

  factory :genre do
    name        {Faker::Movie.title}
    association :user
  end

end