package movierental

import org.springframework.dao.DataIntegrityViolationException
import org.codehaus.groovy.grails.commons.ApplicationHolder as AH
import groovy.sql.Sql
import org.grails.*
import movierental.*
import Classes.*

class Customer {
	
	def dataSource =  AH.application.mainContext.dataSource

	String firstName;
	String lastName;
	String address;
	String contactNumber;
	String email;

    static constraints = {
		firstName(blank:false)
		lastName(blank:false)
		address(blank:false)
		contactNumber(blank:false)
		email()
    }
    
    public void setFirstName(String firstName) {
    	this.firstName = firstName
    }
    
    public void setLastName(String lastName) {
    	this.lastName = lastName
    }
    
    public void setAddress(String address) {
    	this.address = address
    }
    
    public void setContactNumber(String contactNumber) {
    	this.contactNumber = contactNumber
    }
    
    public void setEmail(String email) {
    	this.email = email
    }
    
    public String getFirstName() {
    	return firstName
    }
    
    public String getLastName() {
    	return lastName
    }
    
    public String getAdress() {
    	return address
    }
    
    public String getContactNumber() {
    	return contactNumber
    }
    
    public String getEmail() {
    	return email
    }
    
    public getCustomerIds() {
		def db = new Sql(dataSource)
		def result = db.rows("Select id from customer")
		return result
	}
	
	public getCustomer(String parameter) {
		def db = new Sql(dataSource)
		String query = """select id, first_name, last_name from customer where first_name ilike '%${parameter}%' or last_name ilike '%${parameter}%' order
									by first_name asc"""
									
		def result = db.rows(query)
		return result
		
	}
	
	public getCustomerWithId(String id) {
		def db = new Sql(dataSource)
		def result = db.rows("Select * from customer where id='${id}'")
		return result	
	}
	
	public getCustomerLiabilities(String id) {
		def db = new Sql(dataSource)
		def result = db.rows("""select * from ((select * from rented_movie where customer_id='${id}') as a join (select * from movie) as b on
							a.movie_id=b.id)""")
		return result
	}
	
	public void addCustomer(Customer customer, String id) {
		def db = new Sql(dataSource)
		db.execute("""insert into customer(id,address,contact_number,first_name,last_name,email) values 
							('${id}','${customer.getAddress()}','${customer.getContactNumber()}','${customer.getFirstName()}',
							'${customer.getLastName()}','${customer.getEmail()}')""")
	}
	
	public viewCustomer(String id) {
		def db = new Sql(dataSource)
		def result = db.rows("select * from customer where id='${id}'")
		def liabilities = db.rows("""select * from ((select * from rented_movie where customer_id='${id}') as a join (select * from movie) as b on
							a.movie_id=b.id)""")
		return liabilities
	}
	
	public firstName() {
		def db = new Sql(dataSource)
		def result = db.rows("select first_name from customer")
		return result
	}
	
	public lastName() {
		def db = new Sql(dataSource)
		def result = db.rows("select last_name from customer")
		return result
	}

}