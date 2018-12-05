require('pg')
require('pry')
require_relative('../db/sql_runner')


class Album

  attr_reader :id
  attr_accessor :title, :genre, :artist_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @genre = options['genre']
    @artist_id = options['artist_id'].to_i
  end

  def save()
    sql = "INSERT INTO albums (title, genre, artist_id) VALUES ($1, $2, $3) RETURNING id"
    values = [@title, @genre, @artist_id]
    @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM albums"
    albums = SqlRunner.run(sql)
    return albums.map{|albums| Album.new(album)}
  end

  def artist() #returns the selected album's artist
   sql = "SELECT * FROM artist WHERE artist_id = $1"
   values = [@title]
   artist = SqlRunner.run(sql, values)
   return Artist.new(artist)
 end

end
