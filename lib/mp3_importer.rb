require "pry"

class MP3Importer

    attr_accessor :path

    def initialize(path)
        @path = path
    end

    def files
        mp3s = Dir.entries(path)        #returns an array of all file names in a directory.
        mp3s.slice(2, mp3s.size)
    end

    def import
        files.each do |filename|
            Song.new_by_filename(filename)
        end 
    end
end