module Categorisable
  # these are class methods
  def is_categorisable
    attr_writer :categories_names
    after_save :assign_categories
    include InstanceMethods
  end

  def with_categorie(cat)
    joins(:categories).where(:categories => {:name => cat})
  end
  ########################

  module InstanceMethods
    def categorisable?
      true
    end
    def categories_names
      @categories_names || categories.map(&:name)
    end

    private

    def assign_categories
      if @categories_names
        self.categories = @categories_names.map do |name|
          Categorie.find_by_name(name)
        end
      end
    end
  end
end
