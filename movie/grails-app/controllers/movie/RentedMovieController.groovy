package movie

import org.springframework.dao.DataIntegrityViolationException

class RentedMovieController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [rentedMovieInstanceList: RentedMovie.list(params), rentedMovieInstanceTotal: RentedMovie.count()]
    }

    def create() {
        [rentedMovieInstance: new RentedMovie(params)]
    }

    def save() {
        def rentedMovieInstance = new RentedMovie(params)
        if (!rentedMovieInstance.save(flush: true)) {
            render(view: "create", model: [rentedMovieInstance: rentedMovieInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'rentedMovie.label', default: 'RentedMovie'), rentedMovieInstance.id])
        redirect(action: "show", id: rentedMovieInstance.id)
    }

    def show(Long id) {
        def rentedMovieInstance = RentedMovie.get(id)
        if (!rentedMovieInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'rentedMovie.label', default: 'RentedMovie'), id])
            redirect(action: "list")
            return
        }

        [rentedMovieInstance: rentedMovieInstance]
    }

    def edit(Long id) {
        def rentedMovieInstance = RentedMovie.get(id)
        if (!rentedMovieInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'rentedMovie.label', default: 'RentedMovie'), id])
            redirect(action: "list")
            return
        }

        [rentedMovieInstance: rentedMovieInstance]
    }

    def update(Long id, Long version) {
        def rentedMovieInstance = RentedMovie.get(id)
        if (!rentedMovieInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'rentedMovie.label', default: 'RentedMovie'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (rentedMovieInstance.version > version) {
                rentedMovieInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'rentedMovie.label', default: 'RentedMovie')] as Object[],
                          "Another user has updated this RentedMovie while you were editing")
                render(view: "edit", model: [rentedMovieInstance: rentedMovieInstance])
                return
            }
        }

        rentedMovieInstance.properties = params

        if (!rentedMovieInstance.save(flush: true)) {
            render(view: "edit", model: [rentedMovieInstance: rentedMovieInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'rentedMovie.label', default: 'RentedMovie'), rentedMovieInstance.id])
        redirect(action: "show", id: rentedMovieInstance.id)
    }

    def delete(Long id) {
        def rentedMovieInstance = RentedMovie.get(id)
        if (!rentedMovieInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'rentedMovie.label', default: 'RentedMovie'), id])
            redirect(action: "list")
            return
        }

        try {
            rentedMovieInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'rentedMovie.label', default: 'RentedMovie'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'rentedMovie.label', default: 'RentedMovie'), id])
            redirect(action: "show", id: id)
        }
    }
}
