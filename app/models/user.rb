# == Schema Information
# Schema version: 20110529145728
#
# Table name: users
#
#  id                 :integer         not null, primary key
#  name               :string(255)
#  email              :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#  encrypted_password :string(255)
#  salt               :string(255)
#

class User < ActiveRecord::Base
  
    attr_accessible :name,:email,:password,:password_confirmation
    attr_accessor :password
    
    match_regex= /[\w.-]+@[a-z.-]+\.[a-z]+/i;
    
    validates :name, :presence => true,
                     :length   => {:maximum => 32}
                     
    validates :email,:presence   => true,
                     :uniqueness => {:case_sensitive => false},
                     :format     => {:with           => match_regex} 
    
    validates :password, :presence     => true,
                         :confirmation => true,
                         :length       => { :within => 6..40 }
    
    before_save :encrypt_password
    
    private
          
      def encrypt_password
        self.encrypted_password=encrypt(password)    #We put self,as ruby interprets it as a local var if there is no self 
      end                  
      
      def encrypt(string)
        string
      end
      
         
                     
end
