module CausesHelper
	def fetch_causes_from(projects)
		@causes=[]
		projects.each do |project|
		  @causes+= project.causes_interest
		end
		return @causes
	end
end