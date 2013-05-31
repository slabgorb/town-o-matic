class Being
  include Mongoid::Document
  field :names, :type => Array
  field :age, :type => Integer
  field :alive, :type => Boolean
  field :history, :type => Array
  field :gender, :type => String

  embeds_one :genotype

  has_one :phenotype

  has_and_belongs_to_many :spouses, class_name: 'Being'
  has_and_belongs_to_many :children, class_name: 'Being'
  has_and_belongs_to_many :parents, class_name: 'Being'

  scope :living, -> { where(alive: true) }
  scope :dead, -> { where(alive: false) }



  ##
  # Die!
  #
  def die!
    update_attribute(:alive,  false)
  end


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
  # Set the creatures' name
  #
  def name=(name)
    if name.is_a? String
      name = name.split(/\s/)
    end
    names = Array.new(name)
  end

  ##
  # Is this being dead?
  #
  def dead?
    !alive
  end

end
