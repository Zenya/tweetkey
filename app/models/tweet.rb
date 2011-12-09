class Tweet
  include Mongoid::Document
  include Mongoid::Timestamps

  field :hotkey, type: String
  field :description, type: String
  field :author, type: String
  field :category_id, type: String
  field :rank, type: Integer, default: "0"
  field :voter_up, type: Array, default: []
  field :voter_down, type: Array, default: []

  validates_presence_of :hotkey, :description, :category 

  belongs_to :category
  belongs_to :user

  embeds_many :comments

  def to_favorites(user)
    if user.favorites.include?(self.id)
      abort("This tweet already added")
    else
      user.favorites << self.id
      user.save
      user
    end
  end

  def remove_from_favorites(user)
    if user.favorites.include?(self.id)
      user.favorites.delete(self.id)
      user.save
      user
    else
      abort("This tweet already deleted")
    end
  end

  def vote_up(user, author)
    if self.voter_up.include?(user.id)
      abort("Yoy have already voted")
    elsif self.voter_down.include?(user.id)
      self.voter_down.delete(user.id)
      self.voter_up << user.id
      self.rank += 1
      self.save
    else
      self.voter_up << user.id
      self.rank += 1
      self.save

    end
  end

  def vote_down(user, author)
    if self.voter_down.include?(user.id)
      abort("You have already voted")
    elsif self.voter_up.include?(user.id)
      self.voter_up.delete(user.id)
      self.voter_down << user.id
      self.rank -= 1
      user.karma -= 1
      user.save
      self.save
    else
      self.voter_down << user.id
      self.rank -= 1
      user.karma -= 1
      user.save
      self.save
    end

  end
end 

