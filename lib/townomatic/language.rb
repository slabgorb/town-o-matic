require "net/http"
class ::Hash
  def deep_merge(second)
    merger = proc { |key, v1, v2| Hash === v1 && Hash === v2 ? v1.merge(v2, &merger) : v2 }
    self.merge(second, &merger)
  end
end

class ::String
  def blank?
    self.strip.length == 0
  end
end

class ::Array
  def push_shift(val)
    self.push(val).shift
  end
end

module Townomatic
  module Language
    START_TOKEN = '^'
    END_TOKEN = '$'
    LOOKBACK_DEFAULT = 2
    MAX_WORD_SIZE = 15
    class Corpus < Hash
      attr_reader :histo, :lookback, :text

      def initialize(file, lookback = LOOKBACK_DEFAULT)
        @text = File.read(file).downcase.gsub(/[[:punct:]]|[0-9<>^]/, '').strip.split(/\s/).reject(&:blank?)
        @lookback = lookback
        histogram
      end

      ##
      # Compiles the letter probability data structure.
      #
      def histogram
        @histo = Hash.new
        @key = [START_TOKEN] * @lookback
        @text.each do |word|
          @key.push(START_TOKEN).shift
          word.chars.each do |char|
            @histo[@key.clone] ||= []
            @histo[@key.clone] << char
            @key.push_shift(char)
          end
          @key.push_shift(END_TOKEN)
        end
        @histo.delete(@histo.keys.first)
      end


    end


    class Words

      attr_accessor :name, :corpora

      def initialize(corpora, lookback = LOOKBACK_DEFAULT)
        corpora = [corpora] unless corpora.is_a? Array
        @corpora = corpora
        @lookback = lookback
        raise "All corpora must have the same length of lookback" unless (@corpora.map{ |c| c.lookback }.uniq.count == 1)
        histogram
      end

      ##
      # Combines the histograms of the related corpora
      #
      def histogram
        @histogram ||= @corpora.inject({ }) do |m, c|
          m.deep_merge(c.histo)
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
        char = nil
        # choose a random start
        key = @histogram.keys.select { |k| k[0] == START_TOKEN }.sample
        word = ''
        while char != END_TOKEN && word.length < MAX_WORD_SIZE && @histogram[key]
          char = @histogram[key].sample
          word += char
          key.push_shift(char)
        end
        word.gsub(END_TOKEN,'')
      end

      ##
      # select a character based on a random value compared with the
      # character probability factorposition
      #
      def choice(key)
        @histogram[key].to_a.each do |letter_count|
          p letter_count
          p [position, letter_count[1]]
          return letter_count[0] if (position += letter_count[1]) > selection
        end
      end

    end
  end

end
