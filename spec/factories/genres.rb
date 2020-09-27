FactoryBot.define do

  factory :genre do
    id          {1}
    name        {"映画"}
    association :user
  end

end