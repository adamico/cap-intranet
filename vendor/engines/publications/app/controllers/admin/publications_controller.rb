module Admin
  class PublicationsController < Admin::BaseController

    crudify :publication, :sortable => false

    def index
      search_all_publications if searching?
      paginate_all_publications

      render :partial => 'publications' if request.xhr?
    end

  end
end
