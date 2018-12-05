require('pg')
require('pry')
require_relative('../db/sql_runner')

class Artist

  attr_reader :id
  attr_accessor :name

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  def save() #creates a new entry in the artists table
    sql = "INSERT INTO artists (name) VALUES ($1) RETURNING id"
    values = [@name]
    @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end

  def self.all() #returns all of the values in the artists table
    sql = "SELECT * FROM artists"
    artists = SqlRunner.run(sql)
    return artists.map{|artist| Artist.new(artist)}
  end

  def albums() #returns all of the selected artist's albums
    sql = "SELECT * FROM albums WHERE artist_id = $1"
    values = [@id]
    albums = SqlRunner.run(sql, values)
    return albums.map{|album| Album.new(album)}
  end

  def update() #updates an artist entry
    sql = "UPDATE artists SET name = $1 WHERE id = $2"
    values = [@name, @id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all() #deletes everything from the artists table
    sql = "DELETE FROM artists"
    SqlRunner.run(sql)
  end

  def delete() #returns all of the selected artist's albums
   sql = "DELETE FROM artists WHERE id = $1"
   values = [@id]
   SqlRunner.run(sql, values)
  end

end
