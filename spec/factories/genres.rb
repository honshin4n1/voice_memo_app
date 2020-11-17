FactoryBot.define do

  factory :genre do
    name        {"映画"}
    association :user
  end

end