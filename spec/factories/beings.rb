# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :being do
    name ""
    age 1
    alive false
    history ""
    gender "MyString"
  end
end
