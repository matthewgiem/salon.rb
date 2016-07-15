require('spec_helper')

describe("stylist") do
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
