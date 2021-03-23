require 'pry'

 class Artist

     attr_accessor :name
     @@all = []

     def initialize(name)
         @name = name
         @@all << self
     end

     def self.all
         @@all
     end

     def songs
         Song.all.select {|song| song.artist == self}
     end

     def add_song(song_instance)
         song_instance.artist=(self)
     end

     def self.find_or_create_by_name(name)
         self.all.any? {|artist| artist.name == name} ? self.all.detect {|artist| artist.name == name} : Artist.new(name)   
     end

     def print_songs
        songs.each {|song| puts song.name}
     end
end