require('pry')
require_relative ('../models/artist')
require_relative ('../models/album')



artist1 = Artist.new( 'name' => 'Future')
p artist1

album1 = Album.new( 'title' => 'Beast Mode II', 'genre' => 'Trap')
p album1
