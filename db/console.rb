require('pry')
require_relative ('../models/artist')
require_relative ('../models/album')

Album.delete_all
Artist.delete_all



artist1 = Artist.new({ 'name' => 'Future'})
artist1.save

artist1.name = "FUTURE"
artist1.update

artist2 = Artist.new({ 'name' => 'Quavo'})
artist2.save
artist2.delete



album1 = Album.new({
  'title' => 'BEASTMODE II',
  'genre' => 'Trap',
  'artist_id' => artist1.id
  })
album1.save

album2 = Album.new({
  'title' => 'BEASTMODE',
  'genre' => 'Trap',
  'artist_id' => artist1.id
  })
album2.save

album3 = Album.new({
  'title' => 'FUTURE',
  'genre' => 'Rap',
  'artist_id' => artist1.id
  })
album3.save
album3.delete

p Artist.find_by_id(47)
p Album.find_by_id(77)
