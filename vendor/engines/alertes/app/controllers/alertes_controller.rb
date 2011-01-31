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
    # Order by alerte date
    alertes = Alerte.order("date DESC")
    @alertes_annees = alertes.group_by { |a| a.date.beginning_of_year }
  end

  def find_page
    @page = Page.find_by_link_url("/alertes")
  end

end
