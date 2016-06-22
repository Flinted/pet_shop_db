class Pet

  def initialize(options, runner)
    @id = options['id']
    @name = options['name']
    @type = options['type']
    @store_id = options['store_id']
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
    sql = "SELECT * FROM pet_shops WHERE id = #{@id}"
    store = @runner.run(sql).first
    return store['name']
  end
end