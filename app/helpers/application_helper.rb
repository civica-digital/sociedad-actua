module ApplicationHelper

  #regresa la liga de edit conforme al typo de usuario
  def link_to_edit_profile(user)
    case user.profile_type
      when "Collaborator"
       return edit_collaborator_es_path(user.profile.id) 
      when "Investor"
        return edit_investor_es_path(user.profile.id)
      when "Organization"
       return edit_organization_es_path(user.profile.id)
      else
    end 
  end


  def user_full_signed?(user)
    user_signed_in? && user_completed_register?(user)
  end


  def user_completed_register?(user)
    return !user.profile.nil?  
  end
end