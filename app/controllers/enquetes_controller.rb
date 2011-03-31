class EnquetesController < ApplicationController

  before_filter :find_all_enquetes
  before_filter :find_page

  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @enquete in the line below:
    present(@page)
  end

  def show
    @enquete = Enquete.find(params[:id])

    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @enquete in the line below:
    present(@page)

    @other_enquetes = Enquete.en_cours.without_self(@enquete)
  end

protected

  def find_all_enquetes
    @categorie = params[:categorie] || nil
    @state = params[:state] || nil
    if @categorie
      categorie = Categorie.find_by_name(@categorie)
      enquetes = categorie.enquetes
      enquetes = enquetes.with_state(@state) if @state
    else
      enquetes = @state ? Enquete.with_state(@state) : Enquete.all
    end
    @enquetes_annees = enquetes.group_by {|e| e.publication.beginning_of_year}
  end

  def find_page
    @page = Page.find_by_link_url("/enquetes")
  end

end
