require "cambridge_tts/version"
require 'net/http'
require 'uri'
require 'mechanize'
module CambridgeTts
  # Your code goes here...
  class Tts
    URL_HOST = "http://dictionary.cambridge.org/dictionary/english/"

    def initialize(text)
      @@mechanize= Mechanize.new
      @word = text
      @link_ogg_us= ""
      @link_mp3_us= ""
      @link_ogg_uk= ""
      @link_mp3_uk= ""
      convert_to_speech
    end

    def link_ogg_us
      @link_ogg_us
    end

    def link_ogg_uk
      @link_ogg_uk
    end

    def link_mp3_uk
      @link_mp3_uk
    end

    def link_mp3_us
      @link_mp3_us
    end

    def save_to_file(link, path="")
      download_speech(link, path)
    end

    def word
      @word
    end

    private
    def convert_to_speech
      str = to_dash(@word)
      begin
        page = @@mechanize.get(URL_HOST+str)
        data = page.at('#dataset-british')
        uk_span=data.at('.uk').at('span.sound')
        @link_mp3_uk=uk_span['data-src-mp3']
        @link_ogg_uk=uk_span['data-src-ogg']
        us_span=data.at('.us').at('span.sound')
        @link_mp3_us=us_span['data-src-mp3']
        @link_ogg_us=us_span['data-src-ogg']
      rescue Mechanize::ResponseCodeError => exception
        if exception.response_code == '404'
          raise 'Word Does Not Exits'
        else
          raise # Some other error, re-raise
        end
      end
    end

    def to_dash(input)
      ouput = input.gsub(" ","-")
    end

    def download_speech(link, path="")
      file = if path.empty?
        str = to_dash(@word)+rand(100..500).to_s
        file_name = File.basename(URI.parse(link).path)
        f = File.open(file_name, 'w')
        f.write(Net::HTTP.get(URI.parse(link)))
        f
      else
        f = File.open(path, 'w')
        f.write(Net::HTTP.get(URI.parse(link)))
        f
      end
      return file
    end
  end
end
