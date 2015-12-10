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

	def get_causes_from(*places, **by)
		causes = places.map do |element|
			split_causes_from(element, by)
		end.flatten(1)

		build_hash_accumulator_from causes
	end

  private
  def split_causes_from(objs, by: [:causes_interest, :other_causes])
		"""
		Genera un array de la forma [[cause, obj]*]
		"""
		causes = []
		objs.each do |obj|
			by.each do |concept|
				members = []
				members = obj.send(concept) if obj.respond_to? concept

				if members.respond_to? :each
					member_and_owner = members.map { |member|
						[member, obj]
					}
				else
					member_and_owner = [[members, obj]]
				end

				causes << member_and_owner
			end
		end
		causes.flatten(1)
	end

	def build_hash_accumulator_from(array_pairs)
		hash = {}
		array_pairs.each do |data|
			unless hash.has_key? data[0]
				hash[data[0]] = []
			end
			hash[data[0]] << data[1]
		end

		hash
	end
end