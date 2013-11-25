# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# Default 'webmaster' user
user = User.new( name:                  'Web Master',
                 surname:               'baway',
                 email:                 'webmaster@baway.com', 
                 password:              'Kimxoxo1979', 
                 password_confirmation: 'Kimxoxo1979', 
                 role:                  -1 )


user.save!
