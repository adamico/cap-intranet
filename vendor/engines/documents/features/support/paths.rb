module NavigationHelpers
  module Refinery
    module Documents
      def path_to(page_name)
        case page_name
        when /the list of documents/
          admin_documents_path

         when /the new document form/
          new_admin_document_path
        else
          nil
        end
      end
    end
  end
end
