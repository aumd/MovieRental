package movie



import org.junit.*
import grails.test.mixin.*

@TestFor(CartController)
@Mock(Cart)
class CartControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/cart/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.cartInstanceList.size() == 0
        assert model.cartInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.cartInstance != null
    }

    void testSave() {
        controller.save()

        assert model.cartInstance != null
        assert view == '/cart/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/cart/show/1'
        assert controller.flash.message != null
        assert Cart.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/cart/list'

        populateValidParams(params)
        def cart = new Cart(params)

        assert cart.save() != null

        params.id = cart.id

        def model = controller.show()

        assert model.cartInstance == cart
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/cart/list'

        populateValidParams(params)
        def cart = new Cart(params)

        assert cart.save() != null

        params.id = cart.id

        def model = controller.edit()

        assert model.cartInstance == cart
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/cart/list'

        response.reset()

        populateValidParams(params)
        def cart = new Cart(params)

        assert cart.save() != null

        // test invalid parameters in update
        params.id = cart.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/cart/edit"
        assert model.cartInstance != null

        cart.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/cart/show/$cart.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        cart.clearErrors()

        populateValidParams(params)
        params.id = cart.id
        params.version = -1
        controller.update()

        assert view == "/cart/edit"
        assert model.cartInstance != null
        assert model.cartInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/cart/list'

        response.reset()

        populateValidParams(params)
        def cart = new Cart(params)

        assert cart.save() != null
        assert Cart.count() == 1

        params.id = cart.id

        controller.delete()

        assert Cart.count() == 0
        assert Cart.get(cart.id) == null
        assert response.redirectedUrl == '/cart/list'
    }
}
