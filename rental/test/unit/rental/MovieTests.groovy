package rental

import grails.test.*
import org.junit.*

class MovieTests extends GrailsUnitTestCase {
    protected void setUp() {
        super.setUp()
    }

    protected void tearDown() {
        super.tearDown()
    }
	
	void testBlankMovieField() {
		mockForConstraintsTests(Movie)
		def movie = new Movie(title:"", medium:"", mediumStatus:"", genre:"Action", director:"Michael Bay", actorOrActresses:"Shia LaBeouf", status:"Rented", rate:"15", overdueRate:"10")	
					  
		assertFalse movie.validate()
		assertEquals 2, movie.errors.errorCount 
		assertEquals "blank", movie.errors["title"]
	}
	
	void testIfMovieListIsEmpty() {
		def thor = new Movie(title:"", medium:"", mediumStatus:"", genre:"", director:"", actorOrActresses:"", status:"", rate:"", overdueRate:"")
		def ironman = new Movie(title:"", medium:"", mediumStatus:"", genre:"", director:"", actorOrActresses:"", status:"", rate:"", overdueRate:"")
		def hulk = new Movie(title:"", medium:"", mediumStatus:"", genre:"", director:"", actorOrActresses:"", status:"", rate:"", overdueRate:"")
		
		mockDomain(Movie, [thor, ironman, hulk])
		def list = Movie.findAllByStatus("Available")
		assertEquals 0, list.size()
	}
	
	//same as movie not rented
	//testIfMovieIsAvailable
	void testIfMovieIsAvailable(){
		def thor = new Movie(title:"", medium:"", mediumStatus:"", genre:"", director:"", actorOrActresses:"", status:"Available", rate:"", overdueRate:"")
		def ironman = new Movie(title:"", medium:"", mediumStatus:"", genre:"", director:"", actorOrActresses:"", status:"Rented", rate:"", overdueRate:"")
		def hulk = new Movie(title:"", medium:"", mediumStatus:"", genre:"", director:"", actorOrActresses:"", status:"Rented", rate:"", overdueRate:"")

		mockDomain(Movie, [thor, ironman, hulk])
		def list = Movie.findAllByStatus("Available")
		assertEquals 1, list.size()
		}
	
	//same as movie is not available
	void testIfMovieIsRented(){
		def thor = new Movie(title:"", medium:"", mediumStatus:"", genre:"", director:"", actorOrActresses:"", status:"Available", rate:"", overdueRate:"")
		def ironman = new Movie(title:"", medium:"", mediumStatus:"", genre:"", director:"", actorOrActresses:"", status:"Rented", rate:"", overdueRate:"")
		def hulk = new Movie(title:"", medium:"", mediumStatus:"", genre:"", director:"", actorOrActresses:"", status:"Rented", rate:"", overdueRate:"")

		mockDomain(Movie, [thor, ironman, hulk])
		def list = Movie.findAllByStatus("Rented")
		assertEquals 2, list.size()
		}
}
