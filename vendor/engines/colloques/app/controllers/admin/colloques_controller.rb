module Admin
  class ColloquesController < Admin::BaseController

    crudify :colloque

    def index
      search_all_colloques if searching?
      paginate_all_colloques

      render :partial => 'colloques' if request.xhr?
    end

  end
end
