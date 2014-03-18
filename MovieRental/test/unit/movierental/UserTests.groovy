package movierental

import grails.test.*

class UserTests extends GrailsUnitTestCase {
    protected void setUp() {
        super.setUp()
    }

    protected void tearDown() {
        super.tearDown()
    }

	void testBlank() {
		mockForConstraintsTests(User)
		def user = new User(name:"",
                      login:"admin",
                      password:"wordpass")
		assertFalse user.validate()
		//assertEquals 1, user.errors.errorCount
		//nagleave ug duha ka blank
		assertEquals 2, user.errors.errorCount 
		assertEquals "blank", user.errors["name"]
	}
	
	void testPassword() {
		mockForConstraintsTests(User)
		def user = new User(password:"fooo")
		assertFalse user.validate()
		assertEquals "minSize", user.errors["password"]
	}
	
	void testUniqueLogin(){
		def jdoe = new User(name:"John Doe",
                      login:"jdoe",
                      password:"password")

		def suziq = new User(name:"Suzi Q",
                       login:"suziq",
                       password:"wordpass")

		mockForConstraintsTests(User, [jdoe, suziq])

		def jane = new User(login:"jdoe")
		assertFalse jane.validate()
		assertEquals "unique", jane.errors["login"]
	}
	
	void testMockDomain(){
		def jdoe = new User(name:"John Doe", role:"clerk")
		def suziq = new User(name:"Suzi Q", role:"admin")
		def jsmith = new User(name:"Jane Smith", role:"clerk")

		mockDomain(User, [jdoe, suziq, jsmith])

		//dynamic finder
		def list = User.findAllByRole("admin")
		assertEquals 1, list.size()

		//NOTE: criteria, Hibernate Query Language (HQL)
		//      and Query By Example (QBE) are not supported
	}
	
	void testMockGorm(){
		def jdoe = new User(name:"John Doe", role:"clerk")
		def suziq = new User(name:"Suzi Q", role:"admin")
		def jsmith = new User(name:"Jane Smith", role:"clerk")

		mockDomain(User, [jdoe, suziq, jsmith])

		def foo = new User(login:"foo")
		foo.name = "Bubba"
		foo.role = "clerk"
		foo.password = "password"
		foo.save()
		assertEquals 4, foo.id  //NOTE: id gets assigned
		assertEquals 3, User.findAllByRole("clerk").size()
	}
}