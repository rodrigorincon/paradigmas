package hellograils

import org.springframework.dao.DataIntegrityViolationException

class DogController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [dogInstanceList: Dog.list(params), dogInstanceTotal: Dog.count()]
    }

    def create() {
        [dogInstance: new Dog(params)]
    }

    def save() {
        def dogInstance = new Dog(params)
        if (!dogInstance.save(flush: true)) {
            render(view: "create", model: [dogInstance: dogInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'dog.label', default: 'Dog'), dogInstance.id])
        redirect(action: "show", id: dogInstance.id)
    }

    def show(Long id) {
        def dogInstance = Dog.get(id)
        if (!dogInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'dog.label', default: 'Dog'), id])
            redirect(action: "list")
            return
        }

        [dogInstance: dogInstance]
    }

    def edit(Long id) {
        def dogInstance = Dog.get(id)
        if (!dogInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'dog.label', default: 'Dog'), id])
            redirect(action: "list")
            return
        }

        [dogInstance: dogInstance]
    }

    def update(Long id, Long version) {
        def dogInstance = Dog.get(id)
        if (!dogInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'dog.label', default: 'Dog'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (dogInstance.version > version) {
                dogInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'dog.label', default: 'Dog')] as Object[],
                          "Another user has updated this Dog while you were editing")
                render(view: "edit", model: [dogInstance: dogInstance])
                return
            }
        }

        dogInstance.properties = params

        if (!dogInstance.save(flush: true)) {
            render(view: "edit", model: [dogInstance: dogInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'dog.label', default: 'Dog'), dogInstance.id])
        redirect(action: "show", id: dogInstance.id)
    }

    def delete(Long id) {
        def dogInstance = Dog.get(id)
        if (!dogInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'dog.label', default: 'Dog'), id])
            redirect(action: "list")
            return
        }

        try {
            dogInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'dog.label', default: 'Dog'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'dog.label', default: 'Dog'), id])
            redirect(action: "show", id: id)
        }
    }
}
