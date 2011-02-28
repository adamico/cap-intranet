require 'stringex'
class SearchController < ApplicationController

  # Display search results given the query supplied
  def show
    @results = SearchEngine.search(params[:query].to_ascii, params[:page])

    present(@page = Page.find_by_link_url("/search"))
  end

end
