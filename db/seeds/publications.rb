puts "creating publications plugins for users"
User.find(:all).each do |user|
  if user.plugins.find_by_name('publications').nil?
    puts "adding publications plugin for user##{user.id}"
    user.plugins.create(:name => 'publications',
                        :position => (user.plugins.maximum(:position) || -1) +1)
  end
end

puts "creating publications page"
page = Page.create(
  :title => 'Publications',
  :link_url => '/publications',
  :deletable => false,
  :position => ((Page.maximum(:position, :conditions => {:parent_id => nil}) || -1)+1),
  :menu_match => '^/publications(\/|\/.+?|)$'
)
Page.default_parts.each do |default_page_part|
  puts "adding default page parts for publication page"
  page.parts.create(:title => default_page_part, :body => nil)
end
