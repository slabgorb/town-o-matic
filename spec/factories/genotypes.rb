
FactoryGirl.define do
  factory :genotype do
    genes {
      (Array(lambda{ Genotype.rand_hex }) * 10).map(&:call)
    }
  end
  factory :labrat, :parent => :genotype do
    genes {
      ['01020304A', '01CCCCCCC']
    }
  end
end
