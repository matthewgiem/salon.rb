class Client

  attr_reader(:name, :stylist_id, :id)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @stylist_id = attributes.fetch(:stylist_id).to_i
    @id = attributes[:id] || nil
  end

  define_method(:==) do |another_client|
    (self.id() == another_client.id())
  end

  define_singleton_method(:all) do
    returned_client = DB.exec('SELECT id, name, stylist_id FROM clients;')
    clients = []
    returned_client.each() do |client|
      name = client.fetch("name")
      stylist_id = client.fetch("stylist_id").to_i()
      id = client.fetch("id").to_i()
      clients.push(Client.new({:name => name, :stylist_id => stylist_id, :id => id}))
    end
    clients
  end

  define_singleton_method(:find) do |identification|
    Client.all().each() do |client|
      if client.id == identification
        return client
      end
    end
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO clients(name, stylist_id) VALUES ('#{name}', '#{stylist_id}') RETURNING id;")
    @id = result.first.fetch('id').to_i()
  end

  define_singleton_method(:delete) do |id|
    DB.exec("DELETE FROM clients WHERE id = #{id}")
  end

  define_method(:update) do |attributes|
    @id = self.id()
    @name = attributes.fetch(:name)
    @stylist_id = attributes.fetch(:stylist_id).to_i()
    DB.exec("UPDATE clients SET name = '#{@name}', stylist_id = #{@stylist_id} WHERE id = #{@id};")
  end
end
