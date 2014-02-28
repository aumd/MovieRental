package rental

class User {
  String name
  String login
  String password
  String role

  static constraints = {
		name(blank:false)
		login(unique:true, blank:false)
		password(password:true, minSize:5)
		role(inList:["admin", "clerk"])
	}
  
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getLogin() {
		return login;
	}
	public void setLogin(String login) {
		this.login = login;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}

  String toString(){
    "${name} (${role})"
  }
 }