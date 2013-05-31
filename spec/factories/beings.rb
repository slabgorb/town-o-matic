# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :being do
    names ['Adam', 'Man']
    age 100
    alive true
    history []
    gender 'male'
    genotype { FactoryGirl.build :genotype }
  end
end


