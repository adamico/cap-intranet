class ColloquesController < ApplicationController

  before_filter :find_all_colloques
  before_filter :find_page

  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @colloque in the line below:
    present(@page)
  end

  def show
    @colloque = Colloque.find(params[:id])

    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @colloque in the line below:
    present(@page)

    @other_colloques = Colloque.same_year(@colloque)
  end

protected

  def find_all_colloques
    @colloques_annees = Colloque.grouped_by_year
  end

  def find_page
    @page = Page.find_by_link_url("/colloques")
  end

end
