package movierental


import Classes.*
import grails.test.mixin.*
import org.junit.*
import junit.framework.TestCase;
import static org.junit.Assert.*


@TestFor(ClerkController)
class ClerkControllerTests {

    void testSomething() {
    	//fail "Implement me"
    }
    
    void addCustomerTest() {
    	ClerkController clerkController = new ClerkController()
    	assertEquals("addCustomer", controller.addCustomer())
    }
    
    void searchForCustomerTest() {
    	ClerkController clerkController = new ClerkController()
    	assertEquals("checkCustomer", controller.searchForCustomer())
    }
    
    void viewCustomerTest() {
    	ClerkController clerkController = new ClerkController()
    	assertEquals("viewCustomer", controller.viewCustomer())
    }
    
    void selectMovieTest() {
    	ClerkController clerkController = new ClerkController()
    	assertEquals("selectMovie", controller.selectMovie())
    }
    
    void addToCartTest() {
    	ClerkController clerkController = new ClerkController()
    	assertEquals("selectMovie", controller.addToCart())
    }
    
    void deleteFormCartTest() {
    	ClerkController clerkController = new ClerkController()
    	assertEquals("selectMovie", controller.deleteFormCart())
    }
    
    void saveTransactionTest(){
    	ClerkController clerkController = new ClerkController()
    	assertEquals("saveTransaction", controller.saveTransaction())
    }
    
    void searchForCustomerRecordTest() {
    	ClerkController clerkController = new ClerkController()
    	assertEquals("searchForCustomer", controller.searchForCustomerRecord())
    }
}
