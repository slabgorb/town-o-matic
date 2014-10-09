require "net/http"
require 'debugger'
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
    MIN_WORD_SIZE = 1
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
        key = [START_TOKEN] * @lookback
        @text.each do |word|
          key.push_shift(START_TOKEN)
          word.chars.each do |char|
            @histo[key.clone] ||= []
            @histo[key.clone] << char
            key.push_shift(char)
          end
          @histo[key.clone] << END_TOKEN if @histo[key]
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
      # make a word from the histogram
      #
      def word
        @start_keys = @histogram.keys.select { |k| k[0] == START_TOKEN }.sort
        char = nil
        #debugger
        key = @start_keys.clone.sample
        #p key
        if key
          word = key.last
          while char != END_TOKEN
            break if @histogram[key].nil?
            char = @histogram[key].clone.sample
            word += char
            key.push_shift(char)
          end
          word.gsub(END_TOKEN,'')

        end
      end

    end
  end

end
