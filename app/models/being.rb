class Being
  include Mongoid::Document
  field :names, :type => Array
  field :age, :type => Integer
  field :alive, :type => Boolean
  field :history, :type => Array
  field :gender, :type => String

  embeds_many :chromosomes
  index "chromosome.genes" => 1

  has_and_belongs_to_many :spouses, class_name: 'Being'
  has_and_belongs_to_many :children, class_name: 'Being'
  has_and_belongs_to_many :parents, class_name: 'Being'

  scope :living, -> { where(alive: true) }
  scope :dead, -> { where(alive: false) }


  ##
  # Is this being alive?
  #
  def alive?
    !!alive
  end

  ##
  # Display the name of the creature
  #
  def name
    names.join(' ')
  end

  ##
  # Is this being dead?
  #
  def dead?
    !alive
  end

end
