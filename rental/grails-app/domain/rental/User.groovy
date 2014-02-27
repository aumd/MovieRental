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

  String toString(){
    "${name} (${role})"
  }
 }