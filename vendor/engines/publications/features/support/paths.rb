module NavigationHelpers
  module Refinery
    module Publications
      def path_to(page_name)
        case page_name
        when /the list of publications/
          admin_publications_path

         when /the new publication form/
          new_admin_publication_path
        else
          nil
        end
      end
    end
  end
end
