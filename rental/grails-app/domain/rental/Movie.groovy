package rental

class Movie {
	String title
	String medium
	String mediumStatus
	String genre
	String director
	String actorOrActress
	String status
	double rate
	double overdueRate
	
    static constraints = {
		title(blank:false)
		medium(inList: ["Blu-Ray","DVD","CD"])
		mediumStatus(inList:["","Damaged"])
		genre(blank:false)
		director(blank:false)
		actorOrActress(blank:false)
		status(inList: ["Available","Rented"])
    }
	
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getMedium() {
		return medium;
	}
	public void setMedium(String medium) {
		this.medium = medium;
	}
	public String getMediumStatus() {
		return mediumStatus;
	}
	public void setMediumStatus(String mediumStatus) {
		this.mediumStatus = mediumStatus;
	}
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	public String getDirector() {
		return director;
	}
	public void setDirector(String director) {
		this.director = director;
	}
	public String getActorOrActress() {
		return actorOrActress;
	}
	public void setActorOrActress(String actorOrActress) {
		this.actorOrActress = actorOrActress;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public double getRate() {
		return rate;
	}
	public void setRate(double rate) {
		this.rate = rate;
	}
	public double getOverdueRate() {
		return overdueRate;
	}
	public void setOverdueRate(double overdueRate) {
		this.overdueRate = overdueRate;
	}

}
