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

    @other_alertes = Alerte.recent.without_self(@alerte)
  end

protected

  def find_all_alertes
    @categorie = params[:categorie] || nil
    if @categorie
      categorie = Categorie.find_by_name(@categorie)
      alertes = categorie.alertes
    else
      alertes = Alerte.all
    end
    @alertes_annees = alertes.group_by { |a| a.date.beginning_of_year }
  end

  def find_page
    @page = Page.find_by_link_url("/alertes")
  end

end
