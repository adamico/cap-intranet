module NavigationHelpers
  module Refinery
    module Enquetes
      def path_to(page_name)
        case page_name
        when /the list of enquetes/
          admin_enquetes_path

         when /the new enquete form/
          new_admin_enquete_path
        else
          nil
        end
      end
    end
  end
end
