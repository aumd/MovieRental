package movierental

import org.springframework.dao.DataIntegrityViolationException
import org.codehaus.groovy.grails.commons.ApplicationHolder as AH
import groovy.sql.Sql
import org.grails.*
import movierental.*
import Classes.*

class Movie {
	
	def dataSource =  AH.application.mainContext.dataSource

	String title;
	String medium;
	String genre;
	String director;
	String actorOrActress;
	String status;
	double rate;
	double overdueRate;
	
    static constraints = {
		title(blank:false)
		medium(blank:false)
		genre(blank:false)
		director(blank:false)
		actorOrActress(blank:false)
		status(blank:false)
    }
    
    public void setTitle(String title) {
    	this.title = title
    }
    
    public void setMedium(String medium) {
    	this.medium = medium
    }
    
    public void setGenre(String genre) {
    	this.genre = genre
    }
    
    public void setDirector(String director) {
    	this.director = director
    }
    
    public void setActorOrActress(String actorOrActress) {
    	this.actorOrActress = actorOrActress
    }
    
    public void setStatus(String status) {
    	this.status = status
    }
    
    public void setRate(double rate) {
    	this.rate = rate
    }
    
    public void setOverdueRate(double overdueRate) {
    	this.overdueRate = overdueRate
    }
    
    public String getTitle() {
    	return title
    }
    
    public String getMedium() {
    	return medium
    }
    
    public String getGenre() {
    	return genre
    }
    
    public String getDirector() {
    	return director
    }
    
    public String getActorOrActress() {
    	return actorOrActress
    }
    
    public String getStatus() {
    	return status
    }
    
    public double getRate() {
    	return rate
    }
    
    public double getOverdueRate() {
    	return overdueRate
    }
    
    public getAvailableMovies(String parameter) {
		def db = new Sql(dataSource)
		String query = """select * from (select * from (select * from ((((select id from movie) except 
						(select movie_id from rented_movie)) except (select movie_id from cart)) as a join
						 (select * from movie) as b on a.id=b.id) as a where status='good') as a where 
						 director ilike '%${parameter}%' or genre ilike '%${parameter}%' or title ilike
						 '%${parameter}%' or medium ilike '%${parameter}%' or actor_or_actress	ilike '%${parameter}%')
					     as a order by a.title asc"""
								 
		def result = db.rows(query)
		return result
		
	}
	
    public getOverdueRate(String id) {
		def db = new Sql(dataSource)
		def result = db.rows("select overdue_rate from movie where id='${id}'")
		return result
	}
	
    public getAllMovies(String parameter) {
		def db = new Sql(dataSource)
		String query = """select * from movie where director ilike '%${parameter}%' or genre ilike '%${parameter}%' or title ilike '%${parameter}%'
							or medium ilike '%${parameter}%' or actor_or_actress ilike '%${parameter}%' order by title asc"""
		def result = db.rows(query)
		return result
	}
	
    public getIds() {
		def db = new Sql(dataSource)
		def result = db.rows("select id from movie")
		return result
	}
	
    public void addMovie(Movie movie,String id) {
		def db = new Sql(dataSource)
		db.execute("""insert into movie(id,director,genre,title,medium,actor_or_actress,status,rate,overdue_rate)
					values('${id}','${movie.getDirector()}','${movie.getGenre()}','${movie.getTitle()}','${movie.getMedium()}',
					'${movie.getActorOrActress()}','${movie.getStatus()}','${movie.getRate()}','${movie.getOverdueRate()}')""")
	}
	
    public getMoviesWithId(String id) {
		def db = new Sql(dataSource)
		def result = db.rows("Select * from movie where id='${id}'")
		return result
	}
	
    public void updateMovie(Movie movie,String id) {
		def db = new Sql(dataSource)
		db.execute("""update movie set title='${movie.getTitle()}', genre='${movie.getGenre()}', director='${movie.getDirector()}',
						 actor_or_actress='${movie.getActorOrActress()}', medium='${movie.getMedium()}',
						rate='${movie.getRate()}',overdue_rate='${movie.getOverdueRate()}' where id='${id}'""")
	}
	
    public void markDamaged(String id) {
		def db = new Sql(dataSource)
		db.execute("update movie set status = 'damaged' where id='${id}'")
	}
	
    public void markGood(String id) {
		def db = new Sql(dataSource)
		db.execute("update movie set status = 'good' where id='${id}'")
	}

}
