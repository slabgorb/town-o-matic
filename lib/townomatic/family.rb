module Townomatic
  module Family

    class Member < Person

      attr_reader :parents, :children, :spouses

      def initialize(given_name = '', family_name='')
        @children = []
        @parents = []
        super(given_name: given_name, family_name: family_name)
        @spouses = []
      end

      def family_name
        @names[:family_name]
      end

      def family_name=(name)
        @names[:family_name] = name
      end

      def <<(child)
        add(child)
      end

      def no_parents
        self.parents.empty?
      end

      def add_parent(parent)
        raise "Parent already added" if @parents.include?(parent)
        @parents << parent
      end

      def marry(spouse)
        raise "Already married" if @spouses.include?(spouse)
        @spouses << spouse
      end

      def divorce!(spouse)
        raise "Not a spouse" unless @spouses.include?(spouse)
        @spouses.delete spouse
      end

      def disown!(child)
        raise "Not a child" unless @children.include?(child)
        @children.delete child
      end

      def siblings
        parents.map{ |parent| parent.children }.flatten.select{ |c| c != self }
      end


      def add(child)
        raise "Child already added" if @children.include?(child)
        @children << child
        child.add_parent self
        child.family_name = self.family_name
        @spouses.each{ |spouse| child.add_parent(spouse) }
      end
    end

  end
end
