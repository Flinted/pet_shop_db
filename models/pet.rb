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
    return pet_data
  end

end