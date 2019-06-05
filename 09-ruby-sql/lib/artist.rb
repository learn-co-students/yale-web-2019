class Artist

  attr_accessor :id, :name

  def initialize(attributes)
    # Artist.new({ name: "Rihanna"})
    attributes.each do |key, value|
      # artist.name= "Rihanna"
      if self.respond_to?("#{key}=")
        self.send("#{key}=", value)
      end
    end
  end

  #  Artist.new(row[0]["name"], row[0]["id"])

  def save
    # if the artist doesn't have an id, we'll add them
    # to the database
    if @id == nil
      # creating a new instance because it ain't on the database

      # HEREDOCS
      sql = <<-SQL
        INSERT INTO artists (name) VALUES (?)
      SQL

      DB[:conn].execute(sql, self.name)

      # In order to give the instance an id
      # retrieve the last entry in the database

      sql = <<-SQL
        SELECT id FROM artists ORDER BY id DESC LIMIT 1
      SQL

      @id = DB[:conn].execute(sql)[0]["id"]
    else

      sql = <<-SQL
        UPDATE artists SET name = ? WHERE id = ?
      SQL

      DB[:conn].execute(sql, self.name, self.id)
      # update attributes in our instance
    end
  end

  def delete
    sql = <<-SQL
      DELETE FROM artists WHERE id = ?
    SQL

    DB[:conn].execute(sql, self.id)
  end

  def self.create(attributes={})
    new_artist = Artist.new(attributes)
    new_artist.save
    new_artist
  end

  def update(attributes)
    attributes.each do |key, value|
      # artist.name= "Rihanna"
      if self.respond_to?("#{key}=")
        self.send("#{key}=", value)
      end
    end

    self.save
  end


  def self.find_by_name(name)
    sql = <<-SQL
      SELECT * FROM artists WHERE name = ? LIMIT 1
    SQL

    row = DB[:conn].execute(sql, name)

    # Updated the code post lecture to account for empty findings
    unless row.empty?
      Artist.new(row[0])
    else
      puts "No data found..."
      nil
    end
  end

  def self.find_all_by_name(name)
    sql = <<-SQL
      SELECT * FROM artists WHERE name = ?
    SQL

    rows = DB[:conn].execute(sql, name)

    # Updated the code post lecture to account for empty findings
    rows.map do |row|
      unless row.empty?
        Artist.new(row)
      else
        nil
      end
    end
  end
end
