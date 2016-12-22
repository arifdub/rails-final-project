class Menu < ActiveRecord::Base
	def self.search(search)
		if search
		where("title like ? OR description like ?", "%#{search}%", "%#{search}%") 
		else
			scoped
		end
		
	end
end
