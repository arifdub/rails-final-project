class Menu < ActiveRecord::Base
	def self.search(search)
		where("Title LIKE ? OR Description LIKE ?", "%#{search}%", "%#{search}%") 
		
		
	end
end
