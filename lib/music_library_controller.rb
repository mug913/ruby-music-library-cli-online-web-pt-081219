require 'pry'

class MusicLibraryController
  
  def initialize(path = './db/mp3s')
    importer = MusicImporter.new(path)
    importer.import
  end

  def call
    input = nil
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"
    until input == "exit"
      input = gets.strip
    end
  end
  
  def list_songs
    output = Song.all.each {|song| song}
    output.uniq!.sort_by! {|song| song.name} 
    output.each_with_index{|item, index| puts "#{index + 1}. #{item.artist.name} - #{item.name} - #{item.genre.name}"}
  end
  
  def list_artists
    output = Artist.all.map {|item| item.name}
    output = output.uniq.sort!
    output.each_with_index{|item, index| puts "#{index + 1}. #{item}"}
  end
  
   def list_genres
    output = Genre.all.map {|item| item.name}
    output = output.uniq.sort!
    output.each_with_index{|item, index| puts "#{index + 1}. #{item}"}
  end
  
  def list_songs_by_artist
    
  end
end


