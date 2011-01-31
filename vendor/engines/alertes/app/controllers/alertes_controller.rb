class AlertesController < ApplicationController

  before_filter :find_all_alertes
  before_filter :find_page

  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @alerte in the line below:
    present(@page)
  end

  def show
    @alerte = Alerte.find(params[:id])

    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @alerte in the line below:
    present(@page)
  end

protected

  def find_all_alertes
    @alertes = Alerte.find(:all, :order => "position ASC")
  end

  def find_page
    @page = Page.find_by_link_url("/alertes")
  end

end
