require('pg')
require('pry')
require_relative('../db/sql_runner')
require_relative('artist')


class Album

  attr_reader :id
  attr_accessor :title, :genre, :artist_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @genre = options['genre']
    @artist_id = options['artist_id'].to_i
  end

  def save() #creates a new entry in the albums table
    sql = "INSERT INTO albums (title, genre, artist_id) VALUES ($1, $2, $3) RETURNING id"
    values = [@title, @genre, @artist_id]
    @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end

  def self.all() #returns all of the values in the albums table
    sql = "SELECT * FROM albums"
    albums = SqlRunner.run(sql)
    return albums.map{|albums| Album.new(album)}
  end

  def artist() #returns the selected album's artist
   sql = "SELECT * FROM artists WHERE id = $1"
   values = [@artist_id]
   artist = SqlRunner.run(sql, values)[0]
   return Artist.new(artist)
 end

 def update() #updates an album entry
   sql = "UPDATE albums SET (title, genre, artist_id) = ($1, $2, $3) WHERE id = $4"
   values = [@title, @genre, @artist_id, @id]
   SqlRunner.run(sql, values)
 end

 def self.delete_all()
   sql = "DELETE FROM albums"
   SqlRunner.run(sql)
 end

end
