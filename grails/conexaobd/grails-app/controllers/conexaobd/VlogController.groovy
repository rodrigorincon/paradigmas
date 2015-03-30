package conexaobd

import org.springframework.dao.DataIntegrityViolationException

class VlogController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [vlogInstanceList: Vlog.list(params), vlogInstanceTotal: Vlog.count()]
    }

    def create() {
        [vlogInstance: new Vlog(params)]
    }

    def save() {
        def vlogInstance = new Vlog(params)
        if (!vlogInstance.save(flush: true)) {
            render(view: "create", model: [vlogInstance: vlogInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'vlog.label', default: 'Vlog'), vlogInstance.id])
        redirect(action: "show", id: vlogInstance.id)
    }

    def show(Long id) {
        def vlogInstance = Vlog.get(id)
        if (!vlogInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'vlog.label', default: 'Vlog'), id])
            redirect(action: "list")
            return
        }

        [vlogInstance: vlogInstance]
    }

    def edit(Long id) {
        def vlogInstance = Vlog.get(id)
        if (!vlogInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'vlog.label', default: 'Vlog'), id])
            redirect(action: "list")
            return
        }

        [vlogInstance: vlogInstance]
    }

    def update(Long id, Long version) {
        def vlogInstance = Vlog.get(id)
        if (!vlogInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'vlog.label', default: 'Vlog'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (vlogInstance.version > version) {
                vlogInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'vlog.label', default: 'Vlog')] as Object[],
                          "Another user has updated this Vlog while you were editing")
                render(view: "edit", model: [vlogInstance: vlogInstance])
                return
            }
        }

        vlogInstance.properties = params

        if (!vlogInstance.save(flush: true)) {
            render(view: "edit", model: [vlogInstance: vlogInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'vlog.label', default: 'Vlog'), vlogInstance.id])
        redirect(action: "show", id: vlogInstance.id)
    }

    def delete(Long id) {
        def vlogInstance = Vlog.get(id)
        if (!vlogInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'vlog.label', default: 'Vlog'), id])
            redirect(action: "list")
            return
        }

        try {
            vlogInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'vlog.label', default: 'Vlog'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'vlog.label', default: 'Vlog'), id])
            redirect(action: "show", id: id)
        }
    }
}
