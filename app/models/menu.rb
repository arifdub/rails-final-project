class Menu < ActiveRecord::Base
	def self.search(search)
		if search
		where("title ilike ? OR description ilike ?", "%#{search}%", "%#{search}%") 
		else
			scoped
		end
		
	end
end
