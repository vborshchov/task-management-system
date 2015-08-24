FactoryGirl.define do
  factory :task do |f|
    f.title       { Faker::Lorem.sentence(2, false) }
    f.description { Faker::Lorem.paragraph }
    f.priority    { Faker::Number.decimal(3, 2) }
    f.due_date    { Faker::Date.forward(23).to_s }
  end

end
