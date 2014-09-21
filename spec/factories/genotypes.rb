
FactoryGirl.define do
  factory :genotype do
    genes_string  {([lambda{ Genotype.rand_hex }] * 10).map(&:call).to_json}
  end
  factory :labrat, :parent => :genotype do
    genes_tring       ['01020304A', '01CCCCCCC'].to_json
  end
end
