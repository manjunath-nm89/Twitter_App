require 'faker'

namespace :db do
  desc "Fill Users DB with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    User.create!(:name  => "Lydwin",
                 :email => "manjunath.nm89@gmail.com",
                 :password => "manju123",
                 :password_confirmation => "manju123")
   
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
end
