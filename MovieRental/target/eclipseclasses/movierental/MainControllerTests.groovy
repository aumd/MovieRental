package movierental



import grails.test.mixin.*
import org.junit.*
import junit.framework.TestCase;
import static org.junit.Assert.*

/**
 * See the API for {@link grails.test.mixin.web.ControllerUnitTestMixin} for usage instructions
 */
@TestFor(MainController)
class MainControllerTests {

    void testSomething() {
       //fail "Implement me"
    }
    
    void requestActionTest() {
    	MainController mainController = new MainController()
    	asserEquals("adminMainPage", mainController.requestAction())
    }
    
    void addClerkInitTest() {
    	MainController mainController = new MainController()
    	assertEquals("addClerk", mainController.addClerkInit())
    }
    
    void addClerkTest() {
    	MainController mainController = new MainController()
    	assertEquals("addClerk", mainController.addClerk())
    }
    
    void addCustomerInitTest() {
    	MainController mainController = new MainController()
    	assertEquals("addCustomer", mainController.addCustomerInit())
   	}
   	
   	void addCustomerTest() {
   		MainController mainController = new MainController()
   		assertEquals("addCustomer", mainController.addCustomer())
   	}
   	
   	void manageInventoryTest() {
   		MainController mainController = new MainController()
   		assertEquals("manageInventory", mainController.manageInventory())	
   	}
   	
   	void addInventoryTest() {
   		MainController mainController = new MainController()
   		assertEquals("manageInventory", mainController.addInventory())	
   	}
   	
   	void editInventoryInitTest() {
   		MainController mainController = new MainController()
   		assertEquals("editInventory", mainController.aditInventoryInit())
   	}
   	
   	void editInventoryTest() {
   		MainController mainController = new MainController()
   		assertEquals("manageInventory", mainController.addInventory())
   	}
   	
   	void markAsDamagedTest() {
   		MainController mainController = new MainController()
   		assertEquals("manageInventory", mainController.markAsDamaged())
   	}
   	
   	void showTransactionsTest() {
   		MainController mainController = new MainController()
   		assertEquals("showTransactions", mainController.showTransactions())
   	}
   	
   	void searchForCustomerTest() {
   		MainController mainController = new MainController()
   		assertEquals("checkCustomer", mainController.searchForCustomer())
   	}
   	
   	void viewCustomerTest() {
   		MainController mainController = new MainController()
   		assertEquals("viewCustomer", mainController.viewCustomer())
   	}
}