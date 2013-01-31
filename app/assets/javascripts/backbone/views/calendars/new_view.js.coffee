Castle.Views.Calendars ||= {}

class Castle.Views.Calendars.NewView extends Backbone.View
  template: JST["backbone/templates/calendars/new"]

  events:
    "submit #new-calendar": "save"

  constructor: (options) ->
    super(options)
    @model = new @collection.model()

    @model.bind("change:errors", () =>
      this.render()
    )

  save: (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.unset("errors")

    @collection.create(@model.toJSON(),
      success: (calendar) =>
        @model = calendar
        window.location.hash = "/#{@model.id}"

      error: (calendar, jqXHR) =>
        @model.set({errors: $.parseJSON(jqXHR.responseText)})
    )

  render: ->
    @$el.html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
