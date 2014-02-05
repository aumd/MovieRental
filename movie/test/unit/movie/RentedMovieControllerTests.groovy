package movie



import org.junit.*
import grails.test.mixin.*

@TestFor(RentedMovieController)
@Mock(RentedMovie)
class RentedMovieControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/rentedMovie/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.rentedMovieInstanceList.size() == 0
        assert model.rentedMovieInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.rentedMovieInstance != null
    }

    void testSave() {
        controller.save()

        assert model.rentedMovieInstance != null
        assert view == '/rentedMovie/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/rentedMovie/show/1'
        assert controller.flash.message != null
        assert RentedMovie.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/rentedMovie/list'

        populateValidParams(params)
        def rentedMovie = new RentedMovie(params)

        assert rentedMovie.save() != null

        params.id = rentedMovie.id

        def model = controller.show()

        assert model.rentedMovieInstance == rentedMovie
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/rentedMovie/list'

        populateValidParams(params)
        def rentedMovie = new RentedMovie(params)

        assert rentedMovie.save() != null

        params.id = rentedMovie.id

        def model = controller.edit()

        assert model.rentedMovieInstance == rentedMovie
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/rentedMovie/list'

        response.reset()

        populateValidParams(params)
        def rentedMovie = new RentedMovie(params)

        assert rentedMovie.save() != null

        // test invalid parameters in update
        params.id = rentedMovie.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/rentedMovie/edit"
        assert model.rentedMovieInstance != null

        rentedMovie.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/rentedMovie/show/$rentedMovie.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        rentedMovie.clearErrors()

        populateValidParams(params)
        params.id = rentedMovie.id
        params.version = -1
        controller.update()

        assert view == "/rentedMovie/edit"
        assert model.rentedMovieInstance != null
        assert model.rentedMovieInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/rentedMovie/list'

        response.reset()

        populateValidParams(params)
        def rentedMovie = new RentedMovie(params)

        assert rentedMovie.save() != null
        assert RentedMovie.count() == 1

        params.id = rentedMovie.id

        controller.delete()

        assert RentedMovie.count() == 0
        assert RentedMovie.get(rentedMovie.id) == null
        assert response.redirectedUrl == '/rentedMovie/list'
    }
}
