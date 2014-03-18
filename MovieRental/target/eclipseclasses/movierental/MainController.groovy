package movierental

import org.grails.*
import groovy.sql.Sql
import movierental.*
import Classes.*


class MainController {

	def searchableService
	def dataSource
	def sessionFactory

    def index() { 
		Request rd = new Request()
		def request = rd.getAllRequests()
		
		render(view:"adminMainPage",model:[requests:request])
	}
	
	def requestAction() {
		def response = params.response
		def id = params.id
		
		Request request = new Request()
		def infos = request.getRequest(id)
		def info = infos.get(0)
		
		Customer customer = new Customer()
		customer.setAddress(info.address)
		customer.setContactNumber(info.contact_number)
		customer.setFirstName(info.first_name)
		customer.setLastName(info.last_name)
		customer.setEmail(info.email)
		
		Request rd = new Request()
		
		switch(response) {
			case "Approve":
				customer.addCustomer(customer,info.id)
				rd.deleteRequest(id)
				index();
				break
			case "Reject":
				rd.deleteRequest(id)
				index();
				break
			default:
				render("ERROR");
				break;
		}

	}
	
	def addClerkInit() {
		render(view:"addClerk")
	}
	
	def addClerk() {
		def fullName = params.fullName
		def userName = params.userName
		def password1 = params.password1
		def password2 = params.password2
		
		Account account = new Account()
		
		def clerkExistingUsername = account.getUserNameDb()
		def clerkExistingPassword = account.getPasswordDb()
		def clerkExistingFullname = account.getFullNameDb()
		
		if(clerkExistingUsername.user_name.contains(userName)) {
			render(view:'usernameAndPasswordExists')
		}else if(clerkExistingFullname.full_name.contains(fullName)) {
			render(view:'clerkExists')
		}else {
		
		account.setFullName(fullName)
		account.setUserName(userName)
		account.setPassword(password1)
		account.setRole("clerk")
		
		switch(password1) {
			case password2:
				account.addAccount(account)
				index();
				break
			default:
				index();
				break
		}
		}
	}
	
	def addCustomerInit() {
		render(view:"addCustomer")
	}
	
	def addCustomer() {
		Customer customer = new Customer()
		Customer cd = new Customer()
		customer.setFirstName(params.firstName)
		customer.setLastName(params.lastName)
		customer.setAddress(params.address)
		customer.setContactNumber(params.contactNumber)
		customer.setEmail(params.email)
		
		IdGenerator ig = new IdGenerator()
		String idNumber = ig.generateCustomerId()
				
		Request rd = new Request()
		
		def customerExistingIds = cd.getCustomerIds()
		def requestExistingIds = rd.getExistingIds()
		def customerExistingFirstname = cd.firstName()
		def customerExistingLastname = cd.lastName()
		
		if(customerExistingFirstname.first_name.contains(customer.firstName()) && customerExistingLastname.last_name.contains(customer.lastName())) {
			render(view:"customerExists")
		}else {
		while(customerExistingIds.id.contains(idNumber) && requestExistingIds.id.contains(idNumber)) {
			idCode = ig.generateId()
			idNumber = date+"-"+idCode
		}
		
		
		cd.addCustomer(customer,idNumber)			
		index()
		}
	}
	
	def manageInventory() {
		def parameter = params.parameter
		
		Movie movie = new Movie()
		def movies = movie.getAllMovies(parameter)
		
		render(view:"manageInventory",model:[movies:movies,parameter:parameter])
	
	}
	
	def addInventory() {
		def db = new Sql(dataSource)
		double rate = Double.parseDouble(params.rate)
		double overdueRate = Double.parseDouble(params.overdueRate)
		Movie movie = new Movie()
		//Movie movie = new Movie()
		movie.setTitle(params.title)
		movie.setMedium(params.medium)
		movie.setGenre(params.genre)
		movie.setDirector(params.director)
		movie.setActorOrActress(params.actorOrActress)
		movie.setStatus("good")
		movie.setRate(rate)
		movie.setOverdueRate(overdueRate)
		
		IdGenerator ig = new IdGenerator()
		String idCode = ig.generateId()
		
		def movieExistingIds = movie.getIds()
		
		while(movieExistingIds.id.contains(idCode)) {
			idCode = ig.generateId()
		}
		
		movie.addMovie(movie,idCode)
		
		manageInventory()
		
	}
	
	def editInventoryInit() {
		def id = params.id
		def parameter = params.parameter
		
		Movie md = new Movie()
		def query = md.getMoviesWithId(id)
		def result = query.get(0)
		render(view:"editInventory",model:[infos:result,parameter:parameter])
		
	}
	
	def editInventory() {
		double rate = Double.parseDouble(params.rate)
		double overdueRate = Double.parseDouble(params.overdueRate)
		
		Movie movie = new Movie()
		
		movie.setTitle(params.title)
		movie.setMedium(params.medium)
		movie.setGenre(params.genre)
		movie.setDirector(params.director)
		movie.setActorOrActress(params.actorOrActress)
		movie.setStatus("good")
		movie.setRate(rate)
		movie.setOverdueRate(overdueRate)
		
		def parameter = params.parameter
		def id = params.id
		
		//Movie movie = new Movie()
		movie.updateMovie(movie,id)
		
		manageInventory()
		
	}
	
	def markAsDamaged() {
		def id = params.id
		def parameter = params.parameter
		def marker = params.marker
		
		Movie md = new Movie()
		
		switch(marker) {
			case "Mark as damaged" :
				md.markDamaged(id)
				break
			case "Mark as good" :
				md.markGood(id)
				break;
			default:
				render("error!")
				break;
				
		}
		
		redirect(controller:"main", action:"manageInventory", params:[parameter:parameter])
		
	}
	
	def showTransactions() {
		def db = new Sql(dataSource)
	    def parameter = params.parameter
		Date now = new Date()
		
		Transaction td = new Transaction()
		
		switch(parameter) {
			case null:
				def resultByDay = td.showDaily(now)
				render(view:"showTransactions",model:[transactions:resultByDay,parameter:parameter]);
				break;
			case "daily":
				def resultByDay = td.showDaily(now)
				render(view:"showTransactions",model:[transactions:resultByDay,parameter:parameter]);
				break;
			case "weekly":
				def resultByWeek = td.showWeekly()
				render(view:"showTransactions",model:[transactions:resultByWeek,parameter:parameter]);
				break;
			case "yearly":
				def resultByYear = td.showYearly()
				render(view:"showTransactions",model:[transactions:resultByYear,parameter:parameter]);
				break;
			default:
				showTransactions()
				break;
		}
	}
	
	def searchForCustomer() {
		def db = new Sql(dataSource)
		def parameter = params.parameter
		Customer cd = new Customer()
		def result = cd.getCustomer(parameter)
				
		render(view:"checkCustomer",model:[infos:result,parameter:parameter])
	}
	
	def viewCustomer() {
		def db = new Sql(dataSource)
		def id = params.id
	
		Customer cd = new Customer()
		def result = cd.getCustomerWithId(id)
		def liabilities = cd.getCustomerLiabilities(id)
		
		render(view:"viewCustomer",model:[info:result.get(0),liabilities:liabilities])
	}
}
