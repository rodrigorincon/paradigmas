package conexaobd

class Person {

	String first_name
	String last_name
	Integer year
	String section

	static hasOne = [conteudo: Content]

    static constraints = {
    	conteudo unique: true
    	conteudo nullable: true
    }
}
