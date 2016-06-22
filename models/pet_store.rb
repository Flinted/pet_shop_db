class PetStore

  def initialize(options,runner)
     @id = options['id'] 
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
end