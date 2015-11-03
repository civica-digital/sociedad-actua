module OrganizationsHelper

  def year_to_select(year)
    year.nil? ? '2015' : year
  end

end
