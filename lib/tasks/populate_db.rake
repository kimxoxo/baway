namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do




    # create customers
    10.times do

      name               = Faker::Name.name
      street             = Faker::Address.street_address
      street_number      = "111"
      neighbourhood      = Faker::Name.name
      city               = Faker::Address.city
      tax_number         = (10+rand(59)).to_s + "." + (100+rand(599)).to_s + ".999/9999-99"
      landline           = Faker::PhoneNumber.phone_number
      mobile             = Faker::PhoneNumber.phone_number    
      postal_code        = "234234"
      address_complement = Faker::Name.name
      tax_number_type    = 2
      rg                 = "234234234234"
      email              = (100000+rand(899999)).to_s + "name@email.com"



      customer = Customer.new(name: name,
                              street: street,
                              street_number: street_number,
                              neighbourhood: neighbourhood,
                              city: city,
                              tax_number: tax_number,
                              landline: landline,
                              mobile: mobile,
                              postal_code: postal_code,
                              address_complement: address_complement,
                              tax_number_type: tax_number_type,
                              rg: rg,
                              email: email)

      customer.save!
    end






    # create users
    10.times do

      name     = Faker::Name.name
      surname  = Faker::Name.name
      password = "123456789"
      password_confirmation = "123456789"

      #landline = Faker::PhoneNumber.phone_number
      #mobile   = Faker::PhoneNumber.phone_number    
      email    = (100000+rand(899999)).to_s + "name@email.com"
      role     = rand(1..2)


      user = User.new(name:     name,
                      surname:  surname,
                      password: password,
                      password_confirmation: password_confirmation,
                      #landline: landline,
                      #mobile:   mobile,
                      email:    email,
                      role:     role)

      user.save!
    end








    # create suppliers and products
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


      #products
      20.times do
        supplier_id = supplier.id
        description = Faker::Lorem.sentence
        brand       = Faker::Name.name
        code        = 10000+rand(89999)
        supplier_price = 1.23
        ipi            = 0.99
        ncm            = 1
        width          = 6.78


        product = Product.new(supplier_id: supplier_id,
                      description: description,
                      brand: brand,
                      code: code,
                      supplier_price: supplier_price,
                      ipi: ipi,
                      ncm: ncm,
                      width: width)
        ##
        ##product.save!
        ##
      end



    end






  end
end