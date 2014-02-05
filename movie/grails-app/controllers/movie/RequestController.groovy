package movie

import org.springframework.dao.DataIntegrityViolationException

class RequestController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [requestInstanceList: Request.list(params), requestInstanceTotal: Request.count()]
    }

    def create() {
        [requestInstance: new Request(params)]
    }

    def save() {
        def requestInstance = new Request(params)
        if (!requestInstance.save(flush: true)) {
            render(view: "create", model: [requestInstance: requestInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'request.label', default: 'Request'), requestInstance.id])
        redirect(action: "show", id: requestInstance.id)
    }

    def show(Long id) {
        def requestInstance = Request.get(id)
        if (!requestInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'request.label', default: 'Request'), id])
            redirect(action: "list")
            return
        }

        [requestInstance: requestInstance]
    }

    def edit(Long id) {
        def requestInstance = Request.get(id)
        if (!requestInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'request.label', default: 'Request'), id])
            redirect(action: "list")
            return
        }

        [requestInstance: requestInstance]
    }

    def update(Long id, Long version) {
        def requestInstance = Request.get(id)
        if (!requestInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'request.label', default: 'Request'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (requestInstance.version > version) {
                requestInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'request.label', default: 'Request')] as Object[],
                          "Another user has updated this Request while you were editing")
                render(view: "edit", model: [requestInstance: requestInstance])
                return
            }
        }

        requestInstance.properties = params

        if (!requestInstance.save(flush: true)) {
            render(view: "edit", model: [requestInstance: requestInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'request.label', default: 'Request'), requestInstance.id])
        redirect(action: "show", id: requestInstance.id)
    }

    def delete(Long id) {
        def requestInstance = Request.get(id)
        if (!requestInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'request.label', default: 'Request'), id])
            redirect(action: "list")
            return
        }

        try {
            requestInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'request.label', default: 'Request'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'request.label', default: 'Request'), id])
            redirect(action: "show", id: id)
        }
    }
}
