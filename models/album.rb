require('pg')
require('pry')

class Album

  def initialize(options)
    @title = options['title']
    @genre = options['genre']
  end

end
