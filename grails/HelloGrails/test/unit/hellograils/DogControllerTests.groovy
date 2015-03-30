package hellograils



import org.junit.*
import grails.test.mixin.*

@TestFor(DogController)
@Mock(Dog)
class DogControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/dog/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.dogInstanceList.size() == 0
        assert model.dogInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.dogInstance != null
    }

    void testSave() {
        controller.save()

        assert model.dogInstance != null
        assert view == '/dog/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/dog/show/1'
        assert controller.flash.message != null
        assert Dog.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/dog/list'

        populateValidParams(params)
        def dog = new Dog(params)

        assert dog.save() != null

        params.id = dog.id

        def model = controller.show()

        assert model.dogInstance == dog
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/dog/list'

        populateValidParams(params)
        def dog = new Dog(params)

        assert dog.save() != null

        params.id = dog.id

        def model = controller.edit()

        assert model.dogInstance == dog
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/dog/list'

        response.reset()

        populateValidParams(params)
        def dog = new Dog(params)

        assert dog.save() != null

        // test invalid parameters in update
        params.id = dog.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/dog/edit"
        assert model.dogInstance != null

        dog.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/dog/show/$dog.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        dog.clearErrors()

        populateValidParams(params)
        params.id = dog.id
        params.version = -1
        controller.update()

        assert view == "/dog/edit"
        assert model.dogInstance != null
        assert model.dogInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/dog/list'

        response.reset()

        populateValidParams(params)
        def dog = new Dog(params)

        assert dog.save() != null
        assert Dog.count() == 1

        params.id = dog.id

        controller.delete()

        assert Dog.count() == 0
        assert Dog.get(dog.id) == null
        assert response.redirectedUrl == '/dog/list'
    }
}
