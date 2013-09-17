namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do



    # create admins and operators for the provider company
    10.times do



      name                  = Faker::Name.name
			street 							  = Faker::Address.street_address
			street_number				  = "111"
			neighbourhood 				= Faker::Name.name
			city									= Faker::Address.city
			address_complement    = Faker::Name.name
			cnpj									= "12322585555"
			postal_code						= "234234"
      landline              = Faker::PhoneNumber.phone_number
      mobile                = Faker::PhoneNumber.phone_number    
			email                 = Faker::Internet.email
			ie                 		= "234234234234"


      supplier = Supplier.new(name: name,
      								street: street,
      								street_number: street_number,
      								neighbourhood: neighbourhood,
      								city: city,
      								address_complement: address_complement,
      								cnpj: cnpj,
      								postal_code: postal_code,
      								landline: landline,
      								mobile: mobile,
      								ie: ie)


      #supplier.skip_confirmation!
      supplier.save!

    end






  end
end