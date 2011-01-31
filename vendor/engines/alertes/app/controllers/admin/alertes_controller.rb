module Admin
  class AlertesController < Admin::BaseController

    crudify :alerte,
            :title_attribute => 'titre'

  end
end
