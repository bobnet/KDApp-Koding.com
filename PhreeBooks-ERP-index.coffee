class PhreebooksMainView extends KDView

  constructor:(options = {}, data)->
    options.cssClass = 'phreebooks main-view'
    super options, data

  viewAppended:->
    @addSubView new KDView
      partial  : "Phreebooks Open Source ERP"
      cssClass : "welcome-view"
      
    @addSubView new KDButtonView
     title:     'Click Me!'
     callback:  ->
          alert 'Clicked :)'

class PhreebooksController extends AppController

  constructor:(options = {}, data)->
    options.view    = new PhreebooksMainView
    options.appInfo =
      name : "Phreebooks"
      type : "application"

    super options, data

do ->

  # In live mode you can add your App view to window's appView
  if appView?

    view = new PhreebooksMainView
    appView.addSubView view

  else

    KD.registerAppClass PhreebooksController,
      name     : "Phreebooks"
      routes   :
        "/:name?/Phreebooks" : null
        "/:name?/refactor/Apps/Phreebooks" : null
      dockPath : "/refactor/Apps/Phreebooks"
      behavior : "application"
