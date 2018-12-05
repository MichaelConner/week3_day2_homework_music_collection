require('pry')
require_relative ('../models/artist')
require_relative ('../models/album')



artist1 = Artist.new({ 'name' => 'Future'})
artist1.save


album1 = Album.new({
  'title' => 'Beast Mode II',
  'genre' => 'Trap',
  'artist_id' => artist1.id
  })
album1.save

album2 = Album.new({
  'title' => 'Beast Mode',
  'genre' => 'Trap',
  'artist_id' => artist1.id
  })
album2.save


p artist1.albums
p album2.artist
