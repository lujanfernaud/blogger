class Author < ActiveRecord::Base
  authenticates_with_sorcery!
  validates_confirmation_of :password, message: "should match confirmation" if :password
  
  has_many :articles

  def name
  	username
  end

  def has_articles?
  	self.articles != []
  end
end
