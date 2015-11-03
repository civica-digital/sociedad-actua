module OrganizationsHelper

  def year_to_select(year)
    year.nil? ? Date.today.year : year
  end

end
