class User
  include Mongoid::Document
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  field :username
  field :karma, type: Integer, default: "0"
  field :favorites, type: Array, default: []

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me

  #  has_many :comments
  has_many :tweets

  #  has attached_file :avatar, :styles => { :thumb => "100x100>"}

end
