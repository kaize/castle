module CalendarHelper
  def calendar(events, &block)
    raise 'SimpleCalendar requires a block to be passed in' unless block_given?

    options = {
        :year       => (params[:year] || Time.zone.now.year).to_i,
        :month      => (params[:month] || Time.zone.now.month).to_i,
        :prev_text  => raw("&laquo;"),
        :next_text  => raw("&raquo;")
    }

    events       ||= []
    selected_month = Date.civil(options[:year], options[:month])
    current_date   = Date.today
    range          = build_range selected_month
    month_array    = build_month range

    draw_calendar(selected_month, month_array, current_date, events, options, block)
  end

  private

  def build_range(selected_month)
    start_date = selected_month.beginning_of_month.beginning_of_week
    end_date   = selected_month.end_of_month.end_of_week

    (start_date..end_date).to_a
  end

  def build_month(date_range)
    month = []
    week  = []
    i = 0

    date_range.each do |date|
      week << date
      if i == 6
        i = 0
        month << week
        week = []
      else
        i += 1
      end
    end

    month
  end

  def draw_calendar(selected_month, month, current_date, events, options, block)
    tags = []
    today = Date.today
    content_tag(:table, :class => "table table-bordered table-striped calendar") do
      tags << month_header(selected_month, options)
      tags << content_tag(:thead, abbr_day_names.join.html_safe)
      tags << content_tag(:tbody, :'data-month'=>selected_month.month, :'data-year'=>selected_month.year) do

        month.collect do |week|
          content_tag(:tr, :class => (week.include?(Date.today) ? "current-week week" : "week")) do

            week.collect do |date|
              td_class = ["day"]
              td_class << "today" if today == date
              td_class << "not-current-month" if selected_month.month != date.month
              td_class << "past" if today > date
              td_class << "future" if today < date
              td_class << "wday-#{date.wday.to_s}" # <- to enable different styles for weekend, etc

              content_tag(:td, :class => td_class.join(" "), :'data-date-iso'=>date.to_s, 'data-date'=>date.to_s.gsub('-', '/')) do
                content_tag(:div) do
                  divs = []
                  if day_events?(date, events)
                    day = content_tag(:a, date.day.to_s, href: "").html_safe
                  else
                    day = date.day.to_s
                  end
                  concat content_tag(:div, day, :class=>"day_number")
                  divs.join.html_safe
                end #content_tag :div
              end #content_tag :td

            end.join.html_safe
          end #content_tag :tr

        end.join.html_safe
      end #content_tag :tbody

      tags.join.html_safe
    end #content_tag :table
  end

  def abbr_day_names
    th = []
    tags = []
    #abbr_day_names: [Пн, Вт, Ср, Чт, Пт, Сб, Вс]
    th << content_tag(:th, I18n.t("date.abbr_day_names")[1])
    th << content_tag(:th, I18n.t("date.abbr_day_names")[2])
    th << content_tag(:th, I18n.t("date.abbr_day_names")[3])
    th << content_tag(:th, I18n.t("date.abbr_day_names")[4])
    th << content_tag(:th, I18n.t("date.abbr_day_names")[5])
    th << content_tag(:th, I18n.t("date.abbr_day_names")[6])
    th << content_tag(:th, I18n.t("date.abbr_day_names")[0])
    tags << content_tag(:tr, th.join.html_safe)
  end

  def day_events(date, events)
    events.select { |e| e.start_time.to_date == date }
  end

  def day_events?(date, events)
    events.each { |e|
      if e.start_time.to_date == date
        return true
      end
    }
    false
  end

  def month_header(selected_month, options)
    content_tag :h5 do
      previous_month = selected_month.advance :months => -1
      next_month = selected_month.advance :months => 1
      tags = []

      tags << month_link(options[:prev_text], previous_month, {:class => "previous-month"})
      tags << "#{I18n.t("date.month_names")[selected_month.month]} #{selected_month.year}"
      tags << month_link(options[:next_text], next_month, {:class => "next-month"})

      tags.join.html_safe
    end
  end

  # Generates the link to next and previous months
  def month_link(text, month, opts={})
    link_to(text, "#{simple_calendar_path}?month=#{month.month}&year=#{month.year}", opts)
  end

  # Returns the full path to the calendar
  # This is used for generating the links to the next and previous months
  def simple_calendar_path
    request.fullpath.split('?').first
  end
end