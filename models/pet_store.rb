class PetStore
  attr_reader( :id, :name )
  
  def initialize(options,runner)
     @id = options['id'].to_i
     @name = options['name']
     @address =  options['address']
     @stock_type = options['stock_type']
     @runner =runner
  end

  def save()
    sql = "INSERT INTO pet_shops (name, address, stock_type) VALUES ('#{@name}', '#{@address}','#{@stock_type}') RETURNING *"
    store_data = @runner.run(sql)
    @id = store_data.first['id'].to_i 
  end

  def self.all(runner)
    sql = "SELECT * FROM pet_shops"
    return_info = runner.run(sql)
    stores = return_info.map {|store| PetStore.new(store, runner)}
    return stores
  end

  def self.list_stores(runner)
    stores = self.all(runner)
    stores.each {|store| puts "#{store.name}"}
  end

  def self.find_store(runner, id)
    sql = "SELECT * FROM pet_shops WHERE id = #{id}"
    store = runner.run(sql)
    return store.first['name']
  end

  def list_stores_pets()
    sql = "SELECT * FROM pets WHERE store_id = #{@id}"
    pets = @runner.run(sql)
    pet_data = pets.map {|pet| Pet.new(pet, @runner)}
    return pet_data
  end

  def update(options)
    @name = options['name'] if options['name']
    @address = options['address'] if options['address']
    @stock_type = options['stock_type'] if options['stock_type']

    sql = "UPDATE pet_shops SET name = '#{@name}', address = '#{@address}', stock_type = '#{@stock_type}' WHERE id = #{@id}"
    @runner.run(sql)
  end

  def delete()
    sql = "DELETE FROM pets WHERE store_id = #{@id};
    DELETE FROM pet_shops WHERE id = #{@id}"
    @runner.run(sql)
  end

end