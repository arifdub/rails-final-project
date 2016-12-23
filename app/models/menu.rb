class Menu < ActiveRecord::Base
	def self.search(search)
		where("Title ILIKE ? OR Description ILIKE ?", "%#{search}%", "%#{search}%") 
		
		
	end
end
