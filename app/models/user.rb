# == Schema Information
# Schema version: 20110528051932
#
# Table name: users
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base
  
    attr_accessible :name,:email
    match_regex= //;
    
    validates :name, :presence => true,
                     :length => {:maximum => 32}
                     
    validates :email,:presence   => true,
                     :uniqueness => {:case_sensitive => false},
                     :format     => {:with => match_regex} 
                     
end
