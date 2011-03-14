module Asciiable
  # these are class methods
  def is_asciiable
    include InstanceMethods
  end
  ########################

  module InstanceMethods
    private

    def ascii_titre
      self.titre.to_ascii if self.titre
    end
    def ascii_contenu
      self.contenu.to_ascii if self.contenu
    end
  end
end
