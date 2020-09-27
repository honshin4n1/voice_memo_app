FactoryBot.define do

  factory :content do
    id           {1}
    title        {"もののけ姫"}
    comment      {"面白い"}
    start_time   {"2020-06-25 08:30:00"}
    display      {0}
    association :genre
    association :user
  end

end