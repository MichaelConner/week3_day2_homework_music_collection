## Music Library

You have been asked to create an application that will allow a music collector to manage their collection of albums and keep track of the corresponding artists.

Each artist should have

- a name

Each album should have 

- a title
- a genre

We should also make sure our database is able to represent this ONE-TO-MANY relationship -

### ONE artist has MANY albums

(we should **ignore** for this exercise that in the real world that some albums have MANY artists)

- We'll need to think about how we uniquely identify an artist / album in our database and how we represent this relationship in the database.

<details>
	<summary>Hint (click arrow to expand)</summary>
	An <code>id</code> in each table. One <code>references</code> the other <code>id</code>
</details>

## Don't forget

- All code should be frequently tested (manually) in our `console.rb` or `pry`
- **Error messages are our best friend**. Our overly literal best friend, sometimes you don't get to choose your friends, but treat them with love and affection and you will be rewarded. Pay attention to -
 
	- The file the error is occurring in. Bearing in mind there may be a chain of method calls between different files.
	- The line number where the error is occurring
	- The error message - what is it trying to tell us?
- To keep our code DRY we can use an `SqlRunner`


## MVP

The music collector would like to be able to:

* Create Artists and save them
* Create Albums and save them
* List All Artists/Albums
* List an artist's albums (we should be able to call `artist1.albums`)
* List an album's artist (we should be able to call `album1.artist`)


## Extensions

Additionally it would be nice to be able to:

* Edit albums and artists 
* Delete albums and artists 
* Find albums and artists by id

## Easter Egg

<details>
	<summary>?</summary>	
There was a new message called error<br>    
That would often fill them with terror   <br>   
But by taking their time   <br>   
To read every line  <br>   
Life suddenly seemed so much fairer<br>   
</details>
