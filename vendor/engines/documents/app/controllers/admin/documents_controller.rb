module Admin
  class DocumentsController < Admin::BaseController

    crudify :document,
            :title_attribute => 'titre'

  end
end
