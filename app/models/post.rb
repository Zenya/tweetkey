class Post
  include Mongoid::Document
  include Mongoid::Rateable

  field :name

  belongs_to :user

end
