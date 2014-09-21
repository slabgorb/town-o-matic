module Townomatic
  module Family

    class Member

      attr_reader :parents, :children

      def initialize
        @children = []
        @parents = []
      end

      def <<(child)
        add(child)
      end

      def no_parents
        self.parents.empty?
      end

      def parent=(member)
        @parents << member
      end

      def add(child)
        raise "Child already added" if @children.include?(child)
        @children << child
        child.parent = self
      end
    end

  end
end
