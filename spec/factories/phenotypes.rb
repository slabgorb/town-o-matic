# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :phenotype do
    name "MyString"
    morphology YAML.load_file('spec/morphology.yml')
    development { }
    behavior YAML.load_file('spec/behavior.yml')
  end
end



