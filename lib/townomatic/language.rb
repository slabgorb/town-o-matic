require "net/http"
module Townomatic
  module Language
    START_TOKEN = '^'
    END_TOKEN = '$'
    class Corpus < Hash
      attr_reader :histo
      START_TOKEN = '^'
      END_TOKEN = '$'

      def initialize(file, lookback = 2)
        @text = File.read(file).downcase.gsub(/[[:punct:]]/, ' ').gsub(/\s+|[0-9]/, END_TOKEN).split(//)
        @lookback = lookback
        # @key = []
        @key = [START_TOKEN] * @lookback
        histogram
      end

      ##
      # Compiles the letter probability data structure.
      #
      def histogram
        @histo = Hash.new
        @text.each do |word|
          add word
        end
      end

      def add(word)
        word.chars.each do |char|
          ((@histo[@key.clone] ||= { })[char] ||= 0)
          @histo[@key.clone][char] += 1
          @key.push(char).shift
        end
      end

    end


    class Language

      attr_accessor :name, :lookback, :description, :glossary, :dictionary_file, :corpora

      def initialize(corpora)
        @corpora = corpora
      end

      ##
      # Combines the histograms of the related corpora
      #
      def histogram(force = false)
        @histogram = nil if force
        @histogram ||= @corpora.inject({ }) do |m, c|
          m.deep_merge!(c.histogram(lookback))
        end
        @histogram
      end

      ##
      # Returns the deserialized glossary
      #
      def glossary(force = false)
        JSON.parse glossary_json
      end

      ##
      # make a word from the histogram
      #
      def word
        char = ''
        key = [START_TOKEN] * lookback
        word = ''
        while char.first != END_TOKEN
          char = choice(key)
          word += char.first if char
          key.push(char.first).shift if char
        end
        word.gsub(/[^[:[alpha]:]]/, '')
      end

      ##
      # select a character based on a random value compared with the
      # character probability factorposition
      #
      # for example, assuming a structure of
      # a: 22
      # d: 5
      # e: 45
      # ..etc
      #
      # c = new Charlist
      # ... create structure as above ...
      # c.choice(25)
      # > 'd'
      #
      def choice(key)
        selection = rand(@histogram[key].map(&:length).sum)
        position = 0
        @histogram[key].each_with_index do |index, count|
          return index if (position += count) > selection
        end
        @histogram[key].first
      end

    end
  end

end
