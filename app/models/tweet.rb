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
  field :in_favorites, type: Array, default: []

  validates_presence_of :hotkey, :description, :category 

  belongs_to :category
  belongs_to :user

  embeds_many :comments

  def favorites(user, todo)
    @author = User.where(:email => author).to_a
    if todo == "remove"
      self.in_favorites.delete(user.id)
      @author[0].karma -= 10
      user.favorites.delete(self.id)
    else
      self.in_favorites << user.id
      user.favorites << self.id
      @author[0].karma += 10
    end
    self.save
    @author[0].save
    user.save
    self.in_favorites.count
  end

  def vote_up(user, author)
    @author = User.where(:email => author).to_a
    if self.voter_up.include?(user.id)
      abort("You have already voted")
    elsif self.voter_down.include?(user.id)
      self.voter_down.delete(user.id)
      self.voter_up << user.id
      self.rank += 1
      @author[0].karma += 7
      @author[0].save
      self.save
    else
      self.voter_up << user.id
      self.rank += 1
      @author[0].karma += 5
      @author[0].save
      self.save

    end
  end

  def vote_down(user, author)
    @author = User.where(:email => author).to_a
    if self.voter_down.include?(user.id)
      abort("You have already voted")
    elsif self.voter_up.include?(user.id)
      self.voter_up.delete(user.id)
      self.voter_down << user.id
      self.rank -= 1
      user.karma -=1
      @author[0].karma -= 7
      @author[0].save
      user.save
      self.save
    else
      self.voter_down << user.id
      self.rank -= 1
      user.karma -=1
      @author[0].karma -= 2
      @author[0].save
      user.save
      self.save
    end

  end
end 
