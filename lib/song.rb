require 'pry'

 class Song

     attr_accessor :name
     attr_reader :artist
     @@all = []

     def initialize(name)
         @name = name
         @@all << self 
     end

     def artist=(artist)
         @artist = artist
     end

     def self.all
         @@all
     end

     def self.new_by_filename(file_name)
        artist_name, song_name = file_name.split /\s-\s|\./
    
        song = Song.new(song_name)
        artist = Artist.find_or_create_by_name(artist_name)
        song.artist = artist
        song
     end

     def artist_name=(name)
         self.artist = Artist.find_or_create_by_name(name)
     end
end