module Admin
  class EnquetesController < Admin::BaseController

    crudify :enquete,
            :title_attribute => 'titre'

    def index
      search_all_enquetes if searching?
      paginate_all_enquetes

      render :partial => 'enquetes' if request.xhr?
    end

  end
end
