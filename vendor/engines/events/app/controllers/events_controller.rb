class EventsController < ApplicationController
  before_filter :find_page


  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @event in the line below:
    #present(@page)


    @categorie = params[:categorie] || nil
    if @categorie
      categorie = Categorie.find_by_name(@categorie)
      events = categorie.events.scoped
    else
      events = Event.scoped
    end
    @events = events.after(params[:start]) if params[:start]
    @events = events.before(params[:end]) if params[:end]

    respond_to do |format|
      format.html
      format.xml { render :xml => @events }
      format.js { render :json => @events }
    end

  end

  def show
    @event = Event.find(params[:id])
    @other_events = Event.next.without_self(@event)

    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @event in the line below:
    present(@page)
  end

protected

  def find_page
    @page = Page.find_by_link_url("/events")
  end
end
