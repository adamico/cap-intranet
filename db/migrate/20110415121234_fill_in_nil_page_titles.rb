class FillInNilPageTitles < ActiveRecord::Migration
  def self.up
    say_with_time("Filling in nil page titles") do
      Page.all.each do |page|
        if page.title.nil?
          say "adding title 'temp#{page.id}' for page##{page.id}"
          page.title = "temp#{page.id}"
          page.save!
        end
      end
    end
  end

  def self.down
  end
end
