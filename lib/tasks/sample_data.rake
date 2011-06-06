require 'faker'

namespace :db do
  desc "Fill Users DB with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    admin=User.create!(:name  => "Lydwin",
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
     User.all(:limit=>6).each do |user|
       50.times do
         user.microposts.create!(:content=>Faker::Lorem.sentence(5))
       end
     end
   end

end