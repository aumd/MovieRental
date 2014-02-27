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
	
	void testIfMovieListIsEmpty() {
		//test something here
	}
	
	//same as movie not rented
	//testIfMovieIsAvailable
	void testIfMovieIsAvailable(){
		def thor = new Movie(title:"", medium:"", genre:"", director:"", actorOrActresses:"", status:"Available", rate:"", overdueRate:"")
		def ironman = new Movie(title:"", medium:"", genre:"", director:"", actorOrActresses:"", status:"Rented", rate:"", overdueRate:"")
		def hulk = new Movie(title:"", medium:"", genre:"", director:"", actorOrActresses:"", status:"Rented", rate:"", overdueRate:"")

		mockDomain(Movie, [thor, ironman, hulk])

		//dynamic finder
		def list = Movie.findAllByStatus("Available")
		assertEquals 1, list.size()
		}
	
	//same as movie is not available
	void testIfMovieIsRented(){
		def thor = new Movie(title:"", medium:"", genre:"", director:"", actorOrActresses:"", status:"Available", rate:"", overdueRate:"")
		def ironman = new Movie(title:"", medium:"", genre:"", director:"", actorOrActresses:"", status:"Rented", rate:"", overdueRate:"")
		def hulk = new Movie(title:"", medium:"", genre:"", director:"", actorOrActresses:"", status:"Rented", rate:"", overdueRate:"")

		mockDomain(Movie, [thor, ironman, hulk])

		//dynamic finder
		def list = Movie.findAllByStatus("Rented")
		assertEquals 2, list.size()
		}
}
