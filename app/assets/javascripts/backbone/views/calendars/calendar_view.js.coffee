Castle.Views.Calendars ||= {}

class Castle.Views.Calendars.CalendarView extends Backbone.View
  template: JST["backbone/templates/calendars/calendar"]

  events:
    "click .destroy" : "destroy"

  tagName: "tr"

  destroy: () ->
    @model.destroy()
    this.remove()

    return false

  render: ->
    @$el.html(@template(@model.toJSON() ))
    return this
