package movierental

import org.springframework.dao.DataIntegrityViolationException
import org.codehaus.groovy.grails.commons.ApplicationHolder as AH
import groovy.sql.Sql
import org.grails.*
import movierental.*
import Classes.*

class Account {
	
	def dataSource =  AH.application.mainContext.dataSource
	
	String userName;
	String password;
	String role;
	String fullName;

    static constraints = {
	
		fullName(blank:false)
		userName(blank:false, unique:true)
		password(blank:false)
		role(blank:false)
    }
    
    public Account(String userName, String password, String role, String fullName) {
    	this.userName = userName;
    	this.password = password;
    	this.role = role;
    	this.fullName = fullName;
    }
    
    public void setUserName(String userName) {
    	this.userName = userName
    }
    
    public void setPassword(String password) {
    	this.password = password
    }
    
    public void setRole(String role) {
    	this.role = role
    }
    
    public void setFullName(String fullName) {
    	this.fullName = fullName
    }
    
    public String getUserName() {
    	return userName
    }
    
    public String getPassword() {
    	return password
    }
    
    public String getRole() {
    	return role
    }
    
    public String getFullName() {
    	return fullName
    }
    
    public getUserNameDb() {
		def db = new Sql(dataSource)
		def result = db.rows("select user_name from account")
		return result
	}
	
	public getPasswordDb() {
		def db = new Sql(dataSource)
		def result = db.rows("select password from account")
		return result
	}
	
	public getFullNameDb() {
		def db = new Sql(dataSource)
		def result = db.rows("select full_name from account")
		return result
	}		
	
	public void addAccount(Account account) {
		def db = new Sql(dataSource)
		db.execute("""insert into account(full_name,user_name,password,role) values('${account.getFullName()}',
						'${account.getUserName()}','${account.getPassword()}','${account.getRole()}')""")
	}
 
}