module Admin
  class EventsController < Admin::BaseController
    crudify :event,
            :title_attribute => 'titre',
            :sortable => false
  end
end
