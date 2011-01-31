module Admin
  class AlertesController < Admin::BaseController

    crudify :alerte,
            :title_attribute => 'titre',
            :order => "date DESC",
            :sortable => false

  end
end
