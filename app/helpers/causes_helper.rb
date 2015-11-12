module CausesHelper
	def fetch_causes_from(projects)
		causes=[]
		projects.each do |project|
		  causes+= project.causes_interest
		end
		return sort_causes(causes)
	end
	def sort_causes(causes)
		return causes.sort_by{|cause| cause.downcase}.uniq
	end

end