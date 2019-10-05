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

  def self.create(name)
    song = Song.new(name)
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

  def self.find_or_create_by_name(title)
    if  self.find_by_name(title) == nil
      Song.create(title)
    else 
        self.find_by_name(title)
    end
  end

end
