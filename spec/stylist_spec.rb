require('spec_helper')

describe(Stylist) do
  describe("#find") do
    it("finds a peticular stylist from the database") do
      test_stylist = Stylist.new({:name => "Name"})
      test_stylist.save()
      test_stylist1 = Stylist.new({:name => "Other Name"})
      test_stylist1.save()

      expect(Stylist.find(test_stylist.id())).to(eq(test_stylist))
    end
  end

  describe("#update") do
    it('finds a peticular stylist and changes its values') do
      test_stylist = Stylist.new({:name => "Name"})
      test_stylist.save()
      test_stylist.update({:name => "Other Name"})

      expect(test_stylist.name()).to(eq("Other Name"))
    end
  end

  describe(".all") do
    it("starts out with an empty database so all returns nill") do
      expect(Stylist.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("saves a value in the stylist table") do
      test_stylist = Stylist.new({:name => "matt"})
      test_stylist.save()
      expect(Stylist.all()).to(eq([test_stylist]))
    end
  end

  describe("#delete") do
    it ('will remove a stylist from the database') do
      test_stylist = Stylist.new({:name => "matt"})
      test_stylist.save()
      Stylist.delete(test_stylist.id())
      expect(Stylist.all()).to(eq([]))
    end
  end

  describe("#==") do
    it('will return two lists of the same name') do
      test_stylist = Stylist.new({:name => "matt"})
      test_stylist2 = Stylist.new({:name => "matt"})
      expect(test_stylist).to(eq(test_stylist2))
    end
  end
end
