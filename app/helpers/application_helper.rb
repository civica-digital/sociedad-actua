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
