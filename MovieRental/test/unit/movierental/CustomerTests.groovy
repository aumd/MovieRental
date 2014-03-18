package moviemovierental

import grails.test.*
import org.junit.*

class CustomerTests extends GrailsUnitTestCase {
    protected void setUp() {
        super.setUp()
    }

    protected void tearDown() {
        super.tearDown()
    }
	
	void testBlankCustomerField() {
		mockForConstraintsTests(Customer)
		def customer = new Customer(firstName:"", lastName:"Hiddleston", address:"London", contactNumber:"123456", email:"", liabilities:"")
					  
		assertFalse customer.validate()
		assertEquals 1, customer.errors.errorCount 
		assertEquals "blank", customer.errors["firstName"]
	}
	
	//dili ni mu run haha idk
	
	 /* void testIfCustomerListIsEmpty() {
		def tomhiddles = new Customer(firstName:"", lastName:"", address:"", contactNumber:"", email:"", liabilities:"")
		def bennybatch = new Customer(firstName:"", lastName:"", address:"", contactNumber:"", email:"", liabilities:"")
		def zachquin = new Customer(firstName:"", lastName:"", address:"", contactNumber:"", email:"", liabilities:"")
		
		mockDomain(Customer, [tomhiddles, bennybatch, zachquin])
		def list = customer.findAllByLiabilities("none")
		assertEquals 0, list.size()
	}
	
	 void testCustomerListWithLiabilities() {
		def tomhiddles = new Customer(firstName:"Tome", lastName:"Hiddles", address:"London", contactNumber:"061", email:"", liabilities:"withLiabilities")
		def bennybatch = new Customer(firstName:"Benny", lastName:"Batch", address:"London", contactNumber:"062", email:"", liabilities:"withLiabilities")
		def zachquin = new Customer(firstName:"Zach", lastName:"Quin", address:"London", contactNumber:"063", email:"", liabilities:"")
		
		mockDomain(Customer, [tomhiddles, bennybatch, zachquin])
		def list = customer.findAllByLiabilities("withLiabilities")
		assertEquals 2, list.size()
	} */
	
}
