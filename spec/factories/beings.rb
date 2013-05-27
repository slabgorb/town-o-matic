# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :being do
    name ['Adam', 'Man']
    age 1
    alive true
    history []
    gender 'male'
  end
end
