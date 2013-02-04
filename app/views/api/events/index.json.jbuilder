json.events do
    json.count            @events.count

    json.items do
      json.array! (@events) do |event|
        json.id           event.id
        json.name         event.name
        json.begin_date   event.begin_date
        json.end_date     event.end_date
        json.content      event.content
        json.image        event.image
      end
    end
end