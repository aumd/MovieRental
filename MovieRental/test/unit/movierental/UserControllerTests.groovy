package movierental

import grails.test.mixin.*
import org.junit.*
import junit.framework.TestCase;
import static org.junit.Assert.*

/**
 * See the API for {@link grails.test.mixin.web.ControllerUnitTestMixin} for usage instructions
 */
@TestFor(UserController)
class UserControllerTests {

    void testSomething() {
       //fail "Implement me"
    }
    
    void loginTest() {
    	UserController userController = new UserController()
    	assertEquals("index", userController.login())
    }
    
    void logoutTest() {
    	UserController userController = new UserController()
    	assertEquals("index", userController.logout())
    }
}
