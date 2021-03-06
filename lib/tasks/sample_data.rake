require 'faker'

namespace :db do
  desc "Fill Users DB with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    make_users
    make_microposts
    make_relationships   
     
   end

end

def make_users
  admin=User.create!(:name  => "Manju",
                 :email => "manjunath.nm89@gmail.com",
                 :password => "manju123",
                 :password_confirmation => "manju123")
  admin.toggle!(:admin)

  99.times do |n|
       name=Faker::Name.name
       email="example.#{n+1}@gmail.com"
       password = "manju123"
       User.create!(:name => name,
                    :email => email,
                    :password => password,
                    :password_confirmation => password)
     end
end

def make_microposts
  User.all(:limit=>6, :order => 'id desc').each do |user|
       2.times do
         user.microposts.create!(:content=>Faker::Lorem.sentence(5))
       end
     end
end

def make_relationships
  users=User.all
  user=users.first
  following=users[1..50]
  followers=users[1..40]
  
  following.each {|followed| 
    user.follow!(followed)
    }
    
  followers.each {|follower|
    follower.follow!(user)
    
    }
end