class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    @name = self.new
    @name.save
    @name
  end

  def self.new_by_name(name)
    @name = self.new
    @name.name = name
    @name
  end

  def self.find_by_name(name)
    @@all.find{|song| song.name == name}
  end

  def self.create_by_name(name)
    @name = self.new
    @name.name = name
    @name.save
    @name
  end

  def self.find_or_create_by_name(name)
    if @name.class.find_by_name(name)
      @name
    else
      @name.class.create_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(data)
      data.delete_suffix!(".mp3")
       new_array = data.split(" - ")
       name = self.create
       name.name = new_array[1]
       name.artist_name = new_array[0]

    # data.delete_suffix!(".mp3")
    # new_array = data.split(" - ")
    #
    # song = self.new
    # song.name = new_array[1]
    # song.artist_name = new_array[0]
    # song
  # rows = data.split(/ - |.mp3/)
  # name = rows[1]
  # artist_n = rows[0]
  #
  # song = self.new
  # song.name = name
  # song.artist_name = artist_n
  # song
  end

  def self.create_from_filename(name)
    self.all << self.new_from_filename(name)
  end


  def self.destroy_all
    @@all.clear
  end
end
