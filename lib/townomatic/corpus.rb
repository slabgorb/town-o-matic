module Townomatic
  module Language

    class Corpus < Hash
      field :name, type: String
      field :url, type: String
      belongs_to :language

      @@start_token = ' '
      @@end_token = ' '

      ##
      # Compiles the letter probability data structure.
      #
      def histogram(lookback)
        histo = Hash.new
        key = [@@start_token] * lookback
        get_text.each do |char|
          ((histo[key.clone] ||= { })[char] ||= 0)
          histo[key.clone][char] += 1
          key.push(char).shift
        end
        histo
      end

      ##
      # Reads the file from the web and converts it into an array
      # @see Corpus#compile_histogram
      # TODO: make this work even if pointed to a large file
      #
      def get_text
        Net::HTTP.get(URI('http://' + url.gsub(/http:\/\//,''))).downcase.split(//)#gsub(/[[:[punct]:]:]/, ' ').downcase.gsub(/\s+/, @@end_token).split(//)
      end

    end


    class Language

      attr_accessor :name, :lookback, :description, :glossary, :dictionary_file, :corpora

      ##
      # Combines the histograms of the related corpora
      #
      def histogram(force = false)
        @histogram = nil if force
        @histogram ||= corpora.inject({ }) do |m, c|
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
        key = ['^'] * lookback
        word = ''
        while char.first != '$'
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
