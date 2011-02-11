# encoding: utf-8
module ApplicationHelper
  def site_bar_switch_link
    link_to_if(admin?, t('my_override.switch_to_your_website'),
              (if session.keys.include?(:website_return_to) and session[:website_return_to].present?
                session[:website_return_to]
               else
                root_path
               end)) do
      link_to t('my_override.switch_to_your_website_editor'),
              (if session.keys.include?(:refinery_return_to) and session[:refinery_return_to].present?
                session[:refinery_return_to]
               else
                admin_root_path
               end rescue admin_root_path)
    end
  end
  def links_to_categories(object, method = "name")
    unless object.send("categories").empty?
      links = []
      object.send("categories").each do |item|
        links << link_to(item.send(method).upcase, {:categorie => item.send(method)}, :class => "inline")#polymorphic_path(item))
      end
      safe_concat "<strong>Catégories : </strong>" + links.join(', ')
    end
  end

  def current_path(current_params={})
    polymorphic_path(params[:controller], current_params)
  end
end
