package assets



import org.junit.*
import grails.test.mixin.*

@TestFor(HobbieController)
@Mock(Hobbie)
class HobbieControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/hobbie/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.hobbieInstanceList.size() == 0
        assert model.hobbieInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.hobbieInstance != null
    }

    void testSave() {
        controller.save()

        assert model.hobbieInstance != null
        assert view == '/hobbie/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/hobbie/show/1'
        assert controller.flash.message != null
        assert Hobbie.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/hobbie/list'

        populateValidParams(params)
        def hobbie = new Hobbie(params)

        assert hobbie.save() != null

        params.id = hobbie.id

        def model = controller.show()

        assert model.hobbieInstance == hobbie
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/hobbie/list'

        populateValidParams(params)
        def hobbie = new Hobbie(params)

        assert hobbie.save() != null

        params.id = hobbie.id

        def model = controller.edit()

        assert model.hobbieInstance == hobbie
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/hobbie/list'

        response.reset()

        populateValidParams(params)
        def hobbie = new Hobbie(params)

        assert hobbie.save() != null

        // test invalid parameters in update
        params.id = hobbie.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/hobbie/edit"
        assert model.hobbieInstance != null

        hobbie.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/hobbie/show/$hobbie.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        hobbie.clearErrors()

        populateValidParams(params)
        params.id = hobbie.id
        params.version = -1
        controller.update()

        assert view == "/hobbie/edit"
        assert model.hobbieInstance != null
        assert model.hobbieInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/hobbie/list'

        response.reset()

        populateValidParams(params)
        def hobbie = new Hobbie(params)

        assert hobbie.save() != null
        assert Hobbie.count() == 1

        params.id = hobbie.id

        controller.delete()

        assert Hobbie.count() == 0
        assert Hobbie.get(hobbie.id) == null
        assert response.redirectedUrl == '/hobbie/list'
    }
}
