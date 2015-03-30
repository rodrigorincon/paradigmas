package assets

class Car {

	String name
	String year
	static belongsTo = [person: Person]
	Motor motor
	String toString(){
  		return name
	} 

    static constraints = {
    }
}
