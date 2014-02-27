package rental

class Movie {
	String title;
	String medium;
	String genre;
	String director;
	String actorOrActress;
	String status;
	double rate;
	double overdueRate;
	
    static constraints = {
		title(blank:false)
		medium(inList: ["Blu-Ray","DVD","CD"])
		genre(blank:false)
		director(blank:false)
		actorOrActress(blank:false)
		status(inList: ["Available","Rented"])
    }

}
