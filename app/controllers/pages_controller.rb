class PagesController < ApplicationController

  # This action is usually accessed with the root path, normally '/'
  def home
    error_404 unless (@page = Page.where(:link_url => '/').first).present?
    @categorie = params[:categorie] || nil
    if @categorie
      categorie = Categorie.find_by_name(@categorie)
      @recent_alertes = categorie.alertes.recent
      @next_events = categorie.events.next
      @enquetes_en_cours = categorie.enquetes.en_cours
      @recent_blog_posts = BlogPost.with_blog_categorie(@categorie).live.recent.includes(:comments, :categories)
    else
      @recent_alertes = Alerte.recent
      @next_events = Event.next
      @enquetes_en_cours = Enquete.en_cours
      @recent_blog_posts = BlogPost.live.recent.includes(:comments, :categories)
    end
    @recent_documents = Document.recent
  end

  # This action can be accessed normally, or as nested pages.
  # Assuming a page named "mission" that is a child of "about",
  # you can access the pages with the following URLs:
  #
  #   GET /pages/about
  #   GET /about
  #
  #   GET /pages/mission
  #   GET /about/mission
  #
  def show
    # Find the page by the newer 'path' or fallback to the page's id if no path.
    @page = Page.find(params[:path] ? params[:path].to_s.split('/').last : params[:id])

    @images_groups = @page.images.each_slice(6).to_a
    if @page.try(:live?) or (refinery_user? and current_user.authorized_plugins.include?("refinery_pages"))
      # if the admin wants this to be a "placeholder" page which goes to its first child, go to that instead.
      if @page.skip_to_first_child and (first_live_child = @page.children.order('lft ASC').where(:draft=>false).first).present?
        redirect_to first_live_child.url
      end
    else
      error_404
    end
  end

end
