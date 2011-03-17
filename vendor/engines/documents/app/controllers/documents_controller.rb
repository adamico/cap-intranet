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

    @other_documents = Document.recent.without_self(@document)
  end

protected

  def find_all_documents
    documents = Document.all
    @documents_annees = documents.group_by { |d| d.created_at.beginning_of_year }
  end

  def find_page
    @page = Page.find_by_link_url("/documents")
  end

end
