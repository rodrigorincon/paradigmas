package hotelscaffold



import org.junit.*
import grails.test.mixin.*

@TestFor(HotelController)
@Mock(Hotel)
class HotelControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/hotel/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.hotelInstanceList.size() == 0
        assert model.hotelInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.hotelInstance != null
    }

    void testSave() {
        controller.save()

        assert model.hotelInstance != null
        assert view == '/hotel/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/hotel/show/1'
        assert controller.flash.message != null
        assert Hotel.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/hotel/list'

        populateValidParams(params)
        def hotel = new Hotel(params)

        assert hotel.save() != null

        params.id = hotel.id

        def model = controller.show()

        assert model.hotelInstance == hotel
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/hotel/list'

        populateValidParams(params)
        def hotel = new Hotel(params)

        assert hotel.save() != null

        params.id = hotel.id

        def model = controller.edit()

        assert model.hotelInstance == hotel
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/hotel/list'

        response.reset()

        populateValidParams(params)
        def hotel = new Hotel(params)

        assert hotel.save() != null

        // test invalid parameters in update
        params.id = hotel.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/hotel/edit"
        assert model.hotelInstance != null

        hotel.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/hotel/show/$hotel.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        hotel.clearErrors()

        populateValidParams(params)
        params.id = hotel.id
        params.version = -1
        controller.update()

        assert view == "/hotel/edit"
        assert model.hotelInstance != null
        assert model.hotelInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/hotel/list'

        response.reset()

        populateValidParams(params)
        def hotel = new Hotel(params)

        assert hotel.save() != null
        assert Hotel.count() == 1

        params.id = hotel.id

        controller.delete()

        assert Hotel.count() == 0
        assert Hotel.get(hotel.id) == null
        assert response.redirectedUrl == '/hotel/list'
    }
}
