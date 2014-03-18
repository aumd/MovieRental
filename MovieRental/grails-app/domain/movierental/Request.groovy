package movierental

import org.springframework.dao.DataIntegrityViolationException
import org.codehaus.groovy.grails.commons.ApplicationHolder as AH
import groovy.sql.Sql
import org.grails.*
import movierental.*
import Classes.*

class Request {
	
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
    
    public String getFirstName() {
    	return firstName
    }
    
    public void setLastName(String lastName) {
    	this.lastName = lastName
    }
    
    public String getLastName() {
    	return lastName
    }
    
    public void setAddress(String address) {
    	this.address = address
    }
    
    public String getAddress() {
    	return address
    }
    
    public void setContactNumber(String contactNumber) {
    	this.contactNumber = contactNumber
    }
    
    public String getContactNumber() {
    	return contactNumber
    }
    
    public void setEmail(String email) {
    	this.email = email
    }
    
    public String getEmail() {
    	return email
    }
    
    public void addRequest(Request request, String idNumber) {
		def db = new Sql(dataSource)
		db.execute("""insert into request(id,address,contact_number,first_name,last_name,email) 
					values
					('${idNumber}','${request.getAddress()}','${request.getContactNumber()}',
					'${request.getFirstName()}','${request.getLastName()}','${request.getEmail()}')""")
		
	}
	
    public getExistingIds() {
		def db = new Sql(dataSource)
		def result = db.rows("Select id from request")
		return result
	}
	
    public getAllRequests() {
		def db = new Sql(dataSource)
		def result = db.rows("select * from request")
		return result
	}
	
    public getRequest(String id) {
		def db = new Sql(dataSource)
		def result = db.rows("select * from request where id='${id}'")
		return result
	}
	
    public void deleteRequest(String id) {
		def db = new Sql(dataSource)
		db.execute("delete from request where id='${id}'")
	}
	
}
