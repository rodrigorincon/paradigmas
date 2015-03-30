package assets

class Hobbie {

	String nome
	static belongsTo =  Person
    static hasMany=[person: Person]
    String toString(){
    	return nome
    }

    static constraints = {
    }
}
