require_relative('./models/pet')
require_relative('./models/pet_store')
runner = SqlRunner.new({dbname: 'pet_store', host: 'localhost'})

pet_store1 = PetShop.new({'name' => 'Turtles R us', 'address' => '15 wet street', 'stock_type' => 'aquatic'}, runner)
pet_store2 = PetShop.new({'name' => 'Monkey Business', 'address' => '85 the tree tops', 'stock_type' => 'monkeys'}, runner)

pet_store1.save()
pet_store2.save()

pet1 = Pet.new({'name' => 'Malcolm', 'type' => 'turtle', 'store_id' => pet_store1.id}, runner)
pet2 = Pet.new({'name' => 'Roger', 'type' => 'terrapin', 'store_id' => pet_store1.id}, runner)
pet3 = Pet.new({'name' => 'Susan', 'type' => 'gorilla', 'store_id' => pet_store2.id}, runner)
pet4 = Pet.new({'name' => 'Steve', 'type' => 'orangutan', 'store_id' => pet_store2.id}, runner)
pet5 = Pet.new({'name' => 'Reginald', 'type' => 'gecko', 'store_id' => pet_store1.id}, runner)
pet6 = Pet.new({'name' => 'Louis', 'type' => 'chimp', 'store_id' => pet_store2.id}, runner)

pet1.save()
pet2.save()
pet3.save()
pet4.save()
pet5.save()
pet6.save()