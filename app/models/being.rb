class Being
  include Mongoid::Document
  field :names, :type => Array
  field :age, :type => Integer
  field :alive, :type => Boolean
  field :history, :type => Array
  field :gender, :type => String

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
