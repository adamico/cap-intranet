class PublicationsController < ApplicationController

  before_filter :find_all_publications
  before_filter :find_page

  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @publication in the line below:
    present(@page)
  end

  def show
    @publication = Publication.find(params[:id])

    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @publication in the line below:
    present(@page)

    @other_publications = Publication.recent.without_self(@publication)
  end

protected

  def find_all_publications
    @publication_category = params[:publication_category] || nil
    publications = @publication_category ? Publication.with_publication_category(@publication_category) : Publication.all
    @publications_annees = publications.group_by {|p| p.date.beginning_of_year}
  end

  def find_page
    @page = Page.find_by_link_url("/publications")
  end

end
