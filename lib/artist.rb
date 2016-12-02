class Artist
  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs =[]
  end

  def add_song(songname)
    #song = Song.new(songname)
    @songs << songname
  end

  def save
    @@all << self
    self
  end

  def self.all
    @@all
  end

  def self.find_or_create_by_name(artist)
    match = @@all.find do |x|
      x.name == artist
    end
    if match == nil
      match = Artist.new(artist).save
    end
    match
  end

  def print_songs
    @songs.each do |song|
      puts song.name
    end
  end

end
