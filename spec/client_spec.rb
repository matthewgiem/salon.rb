require('spec_helper')


describe(Client) do
  describe("#find") do
    it("finds a peticular client from the database") do
      test_client = Client.new({:name => "Name", :stylist_id => 1})
      test_client.save()
      test_client1 = Client.new({:name => "Other Name", :stylist_id => 2})
      test_client1.save()

      expect(Client.find(test_client.id())).to(eq(test_client))
    end
  end

  describe("#update") do
    it('finds a peticular client and changes its values') do
      test_client = Client.new({:name => 'Name', :stylist_id => 2})
      test_client.save()
      test_client.update({:name => "Other Name", :stylist_id => 2})

      expect(test_client.name()).to(eq('Other Name'))
    end
  end

  describe("#==") do
    it("compares two clients") do
      client1 = Client.new({:name => 'Matt', :stylist_id => 1 })
      client2 = Client.new({:name => 'Matt', :stylist_id => 1 })
      expect(client1).to(eq(client2))
    end
  end

  describe(".all") do
    it("starts off with no clients") do
      expect(Client.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("saves a client in to the client table") do
      client1 = Client.new({:name => 'Matt', :stylist_id => 1 })
      client1.save()
      expect(Client.all()).to(eq([client1]))
    end
  end

  describe(".delete") do
    it("deletes a client that in the table") do
      client1 = Client.new({:name => 'Matt', :stylist_id => 1 })
      client1.save()
      Client.delete(client1.id())
      expect(Client.all()).to(eq([]))
    end
  end

  describe('#id') do
    it('sets its ID when you save it') do
      client = Client.new({:name => 'Matt', :stylist_id => 1 })
      client.save()
      expect(client.id()).to(be_an_instance_of(Fixnum))
    end
  end
end
