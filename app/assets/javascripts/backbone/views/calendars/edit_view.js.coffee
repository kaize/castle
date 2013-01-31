Castle.Views.Calendars ||= {}

class Castle.Views.Calendars.EditView extends Backbone.View
  template: JST["backbone/templates/calendars/edit"]

  events:
    "submit #edit-calendar": "update"

  update: (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.save(null,
      success: (calendar) =>
        @model = calendar
        window.location.hash = "/#{@model.id}"
    )

  render: ->
    @$el.html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
