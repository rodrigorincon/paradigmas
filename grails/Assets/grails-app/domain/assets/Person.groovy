package assets

class Person {

	String name
	String email
	static hasMany = [cars: Car, hobbies: Hobbie]
	String toString(){
  		return name
	} 

    static constraints = {
    }
}
