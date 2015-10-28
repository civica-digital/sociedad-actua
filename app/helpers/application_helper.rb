module ApplicationHelper

  #regresa la liga de edit conforme al typo de usuario
  def link_to_edit_profile(user)
    case user.profile_type
      when "Collaborator"
       return edit_collaborator_es_path(Collaborator.where(email: user.email).last) 
      when "Investor"
        return edit_investor_es_path(Investor.where(email: user.email).last)
      when "Organization"
       return edit_organization_es_path(Organization.where(email: user.email).last)
      end 
    end
  end


  def user_full_signed?(user)
    user_signed_in? && user_completed_register?(user)
  end


  def user_completed_register?(user)
    case user.profile_type
      when "Collaborator"
       return !Collaborator.where(email: user.email).blank? 
      when "Investor"
        return !Investor.where(email: user.email).blank?
      when "Organization"
       return !Organization.where(email: user.email).blank?
    else
      false
    end 
  end
