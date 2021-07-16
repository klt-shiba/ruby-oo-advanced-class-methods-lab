class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  # Create own custom constructor
  def self.create
    # Must invoke Class.new to instantiate a class
    song = Song.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = Song.new
    song.save
    song.name = name
    song
  end

  def self.find_by_name(name)
    # Find will always return the element if found, otherwise it will return nil
    self.all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    value = self.find_by_name(name)
    if value == nil
      self.create_by_name(name)
    else
      value
    end
  end

  def self.alphabetical
    array = self.all
    array.sort { |a, b| a.name <=> b.name }
  end

  def self.new_from_filename(filename)
    
    # Remove file extension and split in half
    results = filename.delete_suffix!('.mp3').split(' - ')
    song = Song.new
    song.name = results[1]
    song.artist_name = results[0]   
    song

  end

  def self.create_from_filename(filename)
    
    # Remove file extension and split in half
    results = filename.delete_suffix!('.mp3').split(' - ')
    song = Song.new
    song.save
    song.name = results[1]
    song.artist_name = results[0]   
    song

  end

  def self.destroy_all
    @@all.clear
  end

end
