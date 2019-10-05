class Song
  
  attr_accessor :name, :artist, :genre
  
  @@all = [] 
  
  def initialize(name, artist = nil, genre = nil)
    @name = name
    @@all << self
    if artist 
      self.artist = artist
    end
    if genre
      self.genre = genre
    end
  end 
  
  def self.all
    @@all 
  end
  
  def self.destroy_all
    @@all.clear
  end
  
  def save 
    @@all << self 
  end

  def self.create(name,  artist = nil, genre = nil)
    song = Song.new(name,  artist = nil, genre = nil)
    song
  end
  
  def artist= (artist)
    @artist = artist
    artist.add_song(self)
  end  
  
  def genre= (genre)
    @genre = genre
    if !genre.songs.any?(self)
      genre.songs << self 
    end
  end
  
  def self.find_by_name(title)
    target_song = @@all.select{|song| song.name == title}
    target_song[0]
  end

  def self.find_or_create_by_name(title, artist = nil, genre = nil)
    if  self.find_by_name(title) == nil
      Song.create(title, artist = nil, genre = nil)
    else 
        self.find_by_name(title)
    end
  end

  def self.new_from_filename(filename)
    title = filename.split(" - ")
    artist = Artist.find_or_create_by_name(title[0])
    genre = Genre.find_or_create_by_name(title[3])
    new_song = Song.find_or_create_by_name(title[1], artist, genre)
    binding.pry
  end
end
