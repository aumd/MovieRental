package movierental

import org.springframework.dao.DataIntegrityViolationException
import org.codehaus.groovy.grails.commons.ApplicationHolder as AH
import groovy.sql.Sql
import org.grails.*
import movierental.*
import Classes.*

class RentedMovie {
	
	def dataSource =  AH.application.mainContext.dataSource

	String customerId;
	String movieId;
	Date dueDate;
	
    static constraints = {
		customerId(blank:false)
		movieId(blank:false)
		dueDate()
    }
    
    public void setCustomerId(String customerId) {
    	this.customerId = customerId
    }
    
    public void setMovieId(String movieId) {
    	this.movieId = movieId
    }
    
    public void setDueDate(Date dueDate) {
    	this.dueDate = dueDate
    }
    
    public String getCustomerId() {
    	return customerId
    }
    
    public String getMovieId() {
    	return movieId
    }
    
    public Date getDueDate() {
    	return dueDate
    }
    
    public getRentedMovies(String id) {
		def db = new Sql(dataSource)
		def result = db.rows("""select * from ((select * from movie) as a join (select * from rented_movie where 
							customer_id='${id}') as b on a.id=b.movie_id)""")
		return result
	}
	
    public void addRentedMovies(RentedMovie rm) {
		def db = new Sql(dataSource)
		db.execute("""insert into rented_movie(customer_id,movie_id,due_date) 
					values('${rm.getCustomerId()}','${rm.getMovieId()}','${rm.getDueDate()}')""")
	}
	
    public getDueDate(String id) {
		def db = new Sql(dataSource)
		def result = db.rows("select due_date from rented_movie where movie_id='${id}'")
		return result
	}
	
    public void deleteRentedMovies(String movieId) {
		def db = new Sql(dataSource)
		db.execute("delete from rented_movie where movie_id='${movieId}'")
	}
	
}
