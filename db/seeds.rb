10.times do 
  Item.create(
    title: Faker::Commerce.product_name, 
    inventory: Faker::Number.number(2), 
    price: Faker::Number.number(4)
  )
  Category.create(title: Faker::Commerce.department)
end

counter = 1
Item.all.each do |item|
  item.category_id = counter
  item.save
  counter += 1
end

5.times do
  User.create(email: Faker::Internet.email, password: Faker::Internet.password(8))
end

Cart.create(user_id: User.all[0])
Cart.create(user_id: User.all[1])
Cart.create(user_id: User.all[2])
Cart.create(user_id: User.all[3])
Cart.create(user_id: User.all[4])

