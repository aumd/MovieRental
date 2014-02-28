package rental

class Cart {
	Date date
	Movie movie

    static constraints = {
		date(blank:false,unique:true)
		movie(blank:false)
    }
	
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public Movie getMovie() {
		return movie;
	}
	public void setMovie(Movie movie) {
		this.movie = movie;
	}
}
