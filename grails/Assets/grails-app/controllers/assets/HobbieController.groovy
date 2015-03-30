package assets

import org.springframework.dao.DataIntegrityViolationException

class HobbieController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [hobbieInstanceList: Hobbie.list(params), hobbieInstanceTotal: Hobbie.count()]
    }

    def create() {
        [hobbieInstance: new Hobbie(params)]
    }

    def save() {
        def hobbieInstance = new Hobbie(params)
        if (!hobbieInstance.save(flush: true)) {
            render(view: "create", model: [hobbieInstance: hobbieInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'hobbie.label', default: 'Hobbie'), hobbieInstance.id])
        redirect(action: "show", id: hobbieInstance.id)
    }

    def show(Long id) {
        def hobbieInstance = Hobbie.get(id)
        if (!hobbieInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'hobbie.label', default: 'Hobbie'), id])
            redirect(action: "list")
            return
        }

        [hobbieInstance: hobbieInstance]
    }

    def edit(Long id) {
        def hobbieInstance = Hobbie.get(id)
        if (!hobbieInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'hobbie.label', default: 'Hobbie'), id])
            redirect(action: "list")
            return
        }

        [hobbieInstance: hobbieInstance]
    }

    def update(Long id, Long version) {
        def hobbieInstance = Hobbie.get(id)
        if (!hobbieInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'hobbie.label', default: 'Hobbie'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (hobbieInstance.version > version) {
                hobbieInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'hobbie.label', default: 'Hobbie')] as Object[],
                          "Another user has updated this Hobbie while you were editing")
                render(view: "edit", model: [hobbieInstance: hobbieInstance])
                return
            }
        }

        hobbieInstance.properties = params

        if (!hobbieInstance.save(flush: true)) {
            render(view: "edit", model: [hobbieInstance: hobbieInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'hobbie.label', default: 'Hobbie'), hobbieInstance.id])
        redirect(action: "show", id: hobbieInstance.id)
    }

    def delete(Long id) {
        def hobbieInstance = Hobbie.get(id)
        if (!hobbieInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'hobbie.label', default: 'Hobbie'), id])
            redirect(action: "list")
            return
        }

        try {
            hobbieInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'hobbie.label', default: 'Hobbie'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'hobbie.label', default: 'Hobbie'), id])
            redirect(action: "show", id: id)
        }
    }
}
