class Micropost < ActiveRecord::Base
  has_ancestry
  
  belongs_to :user

  #default_scope :order => "microposts.created_at DESC"

  validates :content, :presence => true

  
                      

  validates :user_id, :presence => true
  
  def self.from_users_followed_by(user)
    #followed_ids = user.following.map(&:id).join(", ")
    user_ids = user.following.map(&:id)
    user_ids << user.id
    #Micropost.where("user_id IN (#{followed_ids}) OR user_id=?",user)
    Micropost.where(:user_id => user_ids.uniq)
  end
  
end