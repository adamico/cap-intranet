module Admin
  class EventsController < Admin::BaseController

    crudify :event,
            :title_attribute => 'titre'

  end
end
