class DocumentsController < ApplicationController

  before_filter :find_all_documents
  before_filter :find_page

  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @document in the line below:
    present(@page)
  end

  def show
    @document = Document.find(params[:id])

    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @document in the line below:
    present(@page)
  end

protected

  def find_all_documents
    @documents = Document.find(:all, :order => "position ASC")
  end

  def find_page
    @page = Page.find_by_link_url("/documents")
  end

end
