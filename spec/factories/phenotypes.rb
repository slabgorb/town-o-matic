# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :phenotype do
    name "Test"
    morphology_expression YAML.load_file('spec/morphology.yml')
    behavior_expression YAML.load_file('spec/behavior.yml')
  end
end



