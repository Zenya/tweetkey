class Tweet
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title, type: String
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

  def vote(user, author, rate)
    @author = User.where(:email => author).to_a
    if self.voter_up.include?(user.id)
      if rate == "up"
        self.voter_up.delete(user.id)
        @author[0].karma -= 5
        self.rank -= 1
      else rate == "down"
        self.voter_down << user.id
        self.voter_up.delete(user.id)
        @author[0].karma -= 7
        self.rank -= 2
        user.karma -= 1
      end
    elsif self.voter_down.include?(user.id)
      if rate == "down"
        self.voter_down.delete(user.id)
        @author[0].karma += 2
        user.karma += 1
        self.rank += 1
      else rate == "up"
        self.voter_down.delete(user.id)
        self.voter_up << user.id
        @author[0].karma += 7
        self.rank += 2
      end
    else
      if rate == "up"
        self.voter_up << user.id
        @author[0].karma += 5
        self.rank += 1
      else
        self.voter_down << user.id
        @author[0].karma -= 2
        self.rank -= 1
        user.karma -= 1
      end
    end 
    self.save
    @author[0].save
    user.save
  end
  logger.debug @author
end
