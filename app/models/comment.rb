class Comment
  include Mongoid::Document
  field :username, type: String
  field :content, type: String

  embedded_in :tweet, :inverse_of => :comments
#  belongs_to :user

  validates_presence_of :content
  
end 
