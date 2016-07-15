class Stylist
  attr_reader(:name, :id)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @id = attributes[:id] || nil
  end

  define_singleton_method(:all) do
    returned_stylists = DB.exec('SELECT * FROM stylists ORDER BY name;')
    stylists = []
    returned_stylists.each() do |stylist|
      name = stylist.fetch('name')
      id = stylist.fetch('id').to_i
      stylists.push(Stylist.new({:name => name, :id => id}))
    end
    stylists
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO stylists (name) VALUES ('#{@name}') RETURNING id;")
    @id = result.first().fetch("id").to_i
  end

  define_singleton_method(:find) do |identification|
    Stylists.all().each() do |stylist|
      if stylists.id == identification
        return stylists
      end
    end
  end

  define_singleton_method(:delete) do |id|
    DB.exec("DELETE FROM stylists WHERE id = #{id}")
  end

  define_method(:==) do |another_stylist|
    self.id == another_stylist.id
  end
end
