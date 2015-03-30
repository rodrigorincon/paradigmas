package conexaobd



import org.junit.*
import grails.test.mixin.*

@TestFor(VlogController)
@Mock(Vlog)
class VlogControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/vlog/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.vlogInstanceList.size() == 0
        assert model.vlogInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.vlogInstance != null
    }

    void testSave() {
        controller.save()

        assert model.vlogInstance != null
        assert view == '/vlog/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/vlog/show/1'
        assert controller.flash.message != null
        assert Vlog.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/vlog/list'

        populateValidParams(params)
        def vlog = new Vlog(params)

        assert vlog.save() != null

        params.id = vlog.id

        def model = controller.show()

        assert model.vlogInstance == vlog
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/vlog/list'

        populateValidParams(params)
        def vlog = new Vlog(params)

        assert vlog.save() != null

        params.id = vlog.id

        def model = controller.edit()

        assert model.vlogInstance == vlog
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/vlog/list'

        response.reset()

        populateValidParams(params)
        def vlog = new Vlog(params)

        assert vlog.save() != null

        // test invalid parameters in update
        params.id = vlog.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/vlog/edit"
        assert model.vlogInstance != null

        vlog.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/vlog/show/$vlog.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        vlog.clearErrors()

        populateValidParams(params)
        params.id = vlog.id
        params.version = -1
        controller.update()

        assert view == "/vlog/edit"
        assert model.vlogInstance != null
        assert model.vlogInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/vlog/list'

        response.reset()

        populateValidParams(params)
        def vlog = new Vlog(params)

        assert vlog.save() != null
        assert Vlog.count() == 1

        params.id = vlog.id

        controller.delete()

        assert Vlog.count() == 0
        assert Vlog.get(vlog.id) == null
        assert response.redirectedUrl == '/vlog/list'
    }
}
