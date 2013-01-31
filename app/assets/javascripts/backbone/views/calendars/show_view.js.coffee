Castle.Views.Calendars ||= {}

class Castle.Views.Calendars.ShowView extends Backbone.View
  template: JST["backbone/templates/calendars/show"]

  render: ->
    @$el.html(@template(@model.toJSON() ))
    return this
