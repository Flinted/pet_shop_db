class Pet

  def initialize(options, runner)
    @id = options['id'].to_i
    @name = options['name']
    @type = options['type']
    @store_id = options['store_id'].to_i
    @runner =runner
  end

  def save()
    sql = "INSERT INTO pets (name, type, store_id) VALUES ('#{@name}', '#{@type}','#{@store_id}') RETURNING *"
    pet_data = @runner.run(sql)
    @id = pet_data.first['id'].to_i 
    return pet_data
  end

  def self.all(runner)
    sql = "SELECT * FROM pets"
    return_info = runner.run(sql)
    pets = return_info.map {|pet| Pet.new(pet, runner)}
    return pets
  end

  def show_store()
    sql = "SELECT * FROM pet_shops WHERE id = #{@store_id}"
    store = @runner.run(sql)
    return store.first['name']
  end

  def self.find_pet(runner, id)
    sql = "SELECT * FROM pets WHERE id = #{id}"
    pet = runner.run(sql)
    return pet.first['name']
  end

  def update(options)
    @name = options['name'] if options['name']
    @type = options['type'] if options['type']
    @store_id = options['store_id'] if options['store_id']

    sql = "UPDATE pets SET name = '#{@name}', type = '#{@type}', store_id = '#{@store_id}' WHERE id = #{@id}"
    @runner.run(sql)
  end

  def delete()
    sql = "DELETE FROM pets WHERE id = #{@id}"
    @runner.run(sql)
  end
end