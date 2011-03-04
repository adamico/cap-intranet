class EventsController < ApplicationController
  before_filter :find_all_events
  before_filter :find_page

  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @event in the line below:
    #present(@page)

    @month = (params[:month] || Time.zone.now.month).to_i
    @year = (params[:year] || Time.zone.now.year).to_i

    @shown_month = Date.civil(@year, @month)

    @categorie = params[:categorie] || nil
    if @categorie
      categorie = Categorie.find_by_name(@categorie)
      events = categorie.events.event_strips_for_month(@shown_month)
    else
      events = Event.event_strips_for_month(@shown_month)
    end
    @event_strips = events

    # To restrict what events are included in the result you can pass additional find options like this:
    #
    # @event_strips = Event.event_strips_for_month(@shown_month, :include => :some_relation, :conditions => 'some_relations.some_column = true')

  end

  def show
    @event = Event.find(params[:id])

    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @event in the line below:
    present(@page)
  end

protected

  def find_all_events
    @events = Event.next
  end

  def find_page
    @page = Page.find_by_link_url("/events")
  end

end
