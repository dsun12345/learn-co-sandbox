class Song < ActiveRecord::Base 	

#validate data   	
  validates :name, presence: TRUE	
  validates :artist, presence: TRUE	
  validates :genre, presence: TRUE	
  validates :release_date, presence: TRUE	

  belongs_to :user	

#validate method_name	

end  