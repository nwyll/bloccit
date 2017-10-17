class Post < ApplicationRecord
  belongs_to :topic
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :votes, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  validates :title, length: { minimum: 5 }, presence: true
  validates :body, length: { minimum: 20 }, presence: true
  validates :topic, presence: true
  validates :user, presence: true
  
  default_scope { order('rank DESC') }
  
  after_create :new_post_favorite
  
  def up_votes
    votes.where(value: 1).count
  end
  
  def down_votes
    votes.where(value: -1).count
  end
  
  def points
    votes.sum(:value)
  end
  
  def update_rank
    age_in_days = (created_at - Time.new(1970,1,1)) / 1.day.seconds
    new_rank = points + age_in_days
    update_attribute(:rank, new_rank)
  end
  
  private 
  
  def new_post_favorite
    #favorite the new post for the user
    self.favorites.create!
    #call new_post Mailer to send email to user
    FavoriteMailer.new_post(self.user, self, topic).deliver_now
  end
  
end
