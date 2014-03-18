package movierental

import org.grails.*
import groovy.sql.Sql
import movierental.*
import Classes.*

class ClerkController {	
	
    def index() { 
    	render(view:"clerkMainPage")
	}
	
	def addCustomerInit() {
		render(view:"addCustomer")
	}
	
	def addCustomer() {
		Request request = new Request()
		IdGenerator ig = new IdGenerator()
		
		request.setFirstName(params.firstName)
		request.setLastName(params.lastName)
		request.setAddress(params.address)
		request.setContactNumber(params.contactNumber)
		request.setEmail(params.email)
		
		String idNumber = ig.generateCustomerId()
		
		Request rd = new Request()
		
		def customerExistingIds = new Customer().getCustomerIds()
		def requestExistingIds = rd.getExistingIds()
		
		while(customerExistingIds.id.contains(idNumber) && requestExistingIds.id.contains(idNumber)) {
			idCode = ig.generateId()
			idNumber = date+"-"+idCode
		}
		
		rd.addRequest(request,idNumber)
		
		index()
					
	}
	
	def searchForCustomer() {
		def parameter = params.parameter
		
		Customer cd = new Customer()
		def result = cd.getCustomer(parameter)
	
		render(view:"checkCustomer",model:[infos:result,parameter:parameter])

	}
		
	def viewCustomer() {
		def id = params.id
		
		Customer cd = new Customer()
		def result = cd.getCustomerWithId(id)
		
		def liabilities = cd.getCustomerLiabilities(id)
		render(view:"viewCustomer",model:[info:result.get(0),liabilities:liabilities])
	}
	
	def selectMovie() {	
		Cart cd = new Cart()
		def id = params.id
		def parameter = params.parameter
		
		def counter = cd.getCartCount(id)
		def result2 = cd.getCartItems(id)
		
		Movie md = new Movie()
		def result = md.getAvailableMovies(parameter)
		
		render(view:"selectMovie",model:[id:id,movies:result,parameter:parameter,carts:result2,counter:counter.get(0).count])
	
	}
	
	def addToCart() {
		Cart cart = new Cart()
		cart.setCustomerId(params.id)
		cart.setMovieId(params.movieId)
		
		def parameter = params.parameter
		
		Cart cd = new Cart()
		cd.addCart(cart)
		
		redirect(controller:"clerk", action:"selectMovie", params:[parameter:parameter,id:cart.getCustomerId()])		
		
	}
	
	def deleteFromCart() {
		def parameter = params.parameter
		
		Cart cart = new Cart()
		cart.setMovieId(params.movieId)
		cart.setCustomerId(params.id)
		
		Cart cd = new Cart()
		cd.deleteFromCart(cart)
		
		redirect(controller:"clerk", action:"selectMovie", params:[parameter:parameter,id:cart.getCustomerId()])
	}
	
	def saveTransaction() {
		def id = params.id
		RentedMovie rentedMovie = new RentedMovie()
		rentedMovie.setCustomerId(id)
		
		Date now = new Date()
		Date due = now.plus(7)
		
		def dueFormat = due.format('MM/dd/yyyy')
		Customer customer = new Customer()
		def info = customer.getCustomerWithId(id)
		
		def rentedMovies = rentedMovie.getRentedMovies(id)
		
		Cart cart = new Cart()
		def getCart = cart.getCartItems(id)
		
		def dateFormat = now.format('MM/dd/yyyy')
		rentedMovie.setDueDate(due)
		
		getCart.each{
			rentedMovie.setMovieId(it.movie_id)
			rentedMovie.addRentedMovies(rentedMovie)
		}
	
		Transaction transaction = new Transaction()
		transaction.setCustomerId(id)
		transaction.setDate(now)
		transaction.setType("check out")
	
		getCart.each{
			transaction.setFee(it.rate)
			transaction.setMovieId(it.movie_id)
			transaction.addTransaction(transaction)
		}
		
		rentedMovies = rentedMovie.getRentedMovies(id)
		cart.deleteCart()
		render(view:'saveTransaction',model:[currentDate:dateFormat,info:info.get(0),movies:rentedMovies,dueFormat:dueFormat])
		
	}
	
	def searchForCustomerRecord() {
		def parameter = params.parameter
		
		Customer customer = new Customer()
		def result = customer.getCustomer(parameter)
			
		render(view:"searchCustomer",model:[infos:result,parameter:parameter])
	}
	
	
	
	def viewCustomerRecord() {
		def id = params.id
		RentedMovie rmd = new RentedMovie()
		def result = rmd.getRentedMovies(id)
								
		Date now = new Date()
	    render(view:"viewCustomerRecord",model:[id:id,movies:result,now:now])
	}
	
	def clearLiability() {
		def id = params.id
		def now = new Date()
		List<String> movieID = [params.movieID].flatten()
		
		def totalDue = params.totalDue
		def overdueRate
		def dueDate
		double daysPassed
		double fee
		Movie movie = new Movie()
		RentedMovie rentedMovie = new RentedMovie()
		Transaction transaction = new Transaction()
		transaction.setCustomerId(id)
		transaction.setDate(now)
		transaction.setType("check in")
		
		try{
		movieID.each{
			overdueRate = movie.getOverdueRate(it)
			dueDate = rentedMovie.getDueDate(it)
			daysPassed = now.minus(dueDate.due_date.get(0))
			if(daysPassed > 0) {
			 fee = daysPassed * overdueRate.overdue_rate.get(0)
			 }
			else {
			 fee = 0
			}
			
			transaction.setFee(fee)
			transaction.setMovieId(it)
			transaction.addTransaction(transaction)
			rentedMovie.deleteRentedMovies(it)
		}
		}
		catch(Exception e) {
			index()
		}
		
		index()
	}
}
