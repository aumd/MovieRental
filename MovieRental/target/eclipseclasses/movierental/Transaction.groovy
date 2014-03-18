package movierental

import org.springframework.dao.DataIntegrityViolationException
import org.codehaus.groovy.grails.commons.ApplicationHolder as AH
import groovy.sql.Sql
import org.grails.*
import movierental.*
import Classes.*

class Transaction {
	
	def dataSource =  AH.application.mainContext.dataSource

	String customerId
	String type
	String movieId
	Date date
	double fee

    static mapping = {
    }
    
	static constraints = {
		customerId(blank:false)
		type(blank:false)
		movieId(blank:false)
		date(blank:false)
		fee(blank:false)
    }
	
	public void setCustomerId(String customerId) {
		this.customerId = customerId
	}
	
	public void setType(String type) {
		this.type = type
	}
	
	public void setMovieId(String movieId) {
		this.movieId = movieId
	}
	
	public void setDate(Date date) {
		this.date = date
	}
	
	public void setFee(double fee) {
		this.fee = fee
	}
	
	public String getCustomerId() {
		return customerId
	}
	
	public String getType() {
		return type
	}
	
	public String getMovieId() {
		return movieId
	}
	
	public String getDate() {
		return date
	}
	
	public double getFee() {
		return fee
	}
	
	public void addTransaction(Transaction transaction) {
 		def db = new Sql(dataSource)
 		db.execute("""insert into transaction(customer_id,date,fee,movie_id,type) values
 					('${transaction.getCustomerId()}','${transaction.getDate()}',
 					'${transaction.getFee()}','${transaction.getMovieId()}','${transaction.getType()}')""")
 	}
 	
	public showDaily(Date now) {
 		def db = new Sql(dataSource)
 		def result = db.rows("""select * from((select * from ((select * from transaction) as a join (select * from customer)
 							 as b on a.customer_id=b.id)) as a join (select * from movie) as b on a.movie_id=b.id)
 							  where date='${now.format('MM/dd/yyyy')}'""")
 		return result
 	}
 	
	public showWeekly() {
 		def db = new Sql(dataSource)
 		def result = db.rows("select cast(date_trunc('week', current_date) as date) + i from generate_series(0,6) i")
 		def startOfWeek = result.get(0).get("?column?")
 		def resultByWeek = db.rows("""select * from((select * from ((select * from transaction) as a join (select * from customer) as b on
									a.customer_id=b.id)) as a join (select * from movie) as b on a.movie_id=b.id)
									where date='${startOfWeek}' or date='${startOfWeek.plus(1)}' or date='${startOfWeek.plus(2)}'
									or date='${startOfWeek.plus(3)}' or date='${startOfWeek.plus(4)}' or date='${startOfWeek.plus(5)}'
									or date='${startOfWeek.plus(6)}'""");
		return resultByWeek
 	}
 	
	public showYearly() {
 		def db = new Sql(dataSource)
 		def result = db.rows("""select * from((select * from ((select * from transaction) as a join (select * from customer)
 							 as b on a.customer_id=b.id)) as a join (select * from movie) as b on a.movie_id=b.id)""")
 							 
 		return result
 	}
	
}
