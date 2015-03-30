package assets

import org.springframework.dao.DataIntegrityViolationException

class MotorController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [motorInstanceList: Motor.list(params), motorInstanceTotal: Motor.count()]
    }

    def create() {
        [motorInstance: new Motor(params)]
    }

    def save() {
        def motorInstance = new Motor(params)
        if (!motorInstance.save(flush: true)) {
            render(view: "create", model: [motorInstance: motorInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'motor.label', default: 'Motor'), motorInstance.id])
        redirect(action: "show", id: motorInstance.id)
    }

    def show(Long id) {
        def motorInstance = Motor.get(id)
        if (!motorInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'motor.label', default: 'Motor'), id])
            redirect(action: "list")
            return
        }

        [motorInstance: motorInstance]
    }

    def edit(Long id) {
        def motorInstance = Motor.get(id)
        if (!motorInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'motor.label', default: 'Motor'), id])
            redirect(action: "list")
            return
        }

        [motorInstance: motorInstance]
    }

    def update(Long id, Long version) {
        def motorInstance = Motor.get(id)
        if (!motorInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'motor.label', default: 'Motor'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (motorInstance.version > version) {
                motorInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'motor.label', default: 'Motor')] as Object[],
                          "Another user has updated this Motor while you were editing")
                render(view: "edit", model: [motorInstance: motorInstance])
                return
            }
        }

        motorInstance.properties = params

        if (!motorInstance.save(flush: true)) {
            render(view: "edit", model: [motorInstance: motorInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'motor.label', default: 'Motor'), motorInstance.id])
        redirect(action: "show", id: motorInstance.id)
    }

    def delete(Long id) {
        def motorInstance = Motor.get(id)
        if (!motorInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'motor.label', default: 'Motor'), id])
            redirect(action: "list")
            return
        }

        try {
            motorInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'motor.label', default: 'Motor'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'motor.label', default: 'Motor'), id])
            redirect(action: "show", id: id)
        }
    }
}
