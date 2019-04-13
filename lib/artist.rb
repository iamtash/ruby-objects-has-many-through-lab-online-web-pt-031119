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

  def new_song(song_name, genre)
    song = Song.new(song_name, self, genre)
    song.artist = self
    song
  end

  def songs
    Song.all.select {|song| song.artist == self}
  end

  def genres
    self.songs.map {|song| song.genre}
  end
end
