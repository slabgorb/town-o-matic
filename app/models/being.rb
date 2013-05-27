class Being
  include Mongoid::Document
  field :name, :type => Array
  field :age, :type => Integer
  field :alive, :type => Boolean
  field :history, :type => Array
  field :gender, :type => String

end
