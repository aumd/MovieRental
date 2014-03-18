package movierental

import org.springframework.dao.DataIntegrityViolationException
import org.codehaus.groovy.grails.commons.ApplicationHolder as AH
import groovy.sql.Sql
import org.grails.*
import movierental.*
import Classes.*

class Cart {

	def dataSource =  AH.application.mainContext.dataSource
	
	String customerId;
	String movieId;

    static constraints = {
		customerId(blank:false)
		movieId(blank:false)
    }
    
    public void setCustomerId(String customerId) {
    	this.customerId = customerId
    }
    
    public void setMovieId(String movieId) {
    	this.movieId = movieId
    }
    
    public String getCustomerId() {
    	return customerId
    }
    
    public String getMovieId() {
    	return movieId
    }
    
    public getCartCount(String id) {
		def db = new Sql(dataSource)
		def result = db.rows("select count (*) from cart where customer_id='${id}'")
		return result
	}
	
	public getCartItems(String id) {
		def db = new Sql(dataSource)
		def result = db.rows("""select * from ((select * from cart where customer_id='${id}')
							 as c join (select * from movie) as m on c.movie_id=m.id)""")
		return result
	}
	
	public void addCart(Cart cart) {
		def db = new Sql(dataSource)
		db.execute("insert into cart(customer_id,movie_id) values('${cart.getCustomerId()}','${cart.getMovieId()}')")
	}
	
	public void deleteFromCart(Cart cart) {
		def db = new Sql(dataSource)
		db.execute("delete from cart where customer_id='${cart.getCustomerId()}' and movie_id='${cart.getMovieId()}'")
	}
	
	public void deleteCart() {
		def db = new Sql(dataSource)
		db.execute("delete from cart")
	}
    
}
