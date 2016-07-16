require("spec_helper")
require('capybara/rspec')
require('./app')

Capybara.app = Sinatra::Application
set(:show_exceptions, false)

def expect_page(arr)
  arr.each() do |element|
    expect(page).to have_content(element)
  end
end

def create_stylist(name)
  visit('/owner/stylists/new')
  fill_in('stylist_name', :with => name)
  click_on('Add stylist')
end

def create_clients(name, stylist)
  visit('/owner/clients/new')
  fill_in('client_name', :with => name)
  select(stylist, :from => 'stylist_id')
  click_on('Add client')
end

def delete_clients(name)
  visit('/owner/clients')
  click_on(name)
  click_on("DELETE")
end

def delete_stylists(name)
  visit('/owner/stylists')
  click_on(name)
  click_on("DELETE")
end

def update_client(name, new_name, new_stylist)
  visit('/owner/clients')
  click_on(name)
  fill_in("client_name", :with => new_name)
  select(new_stylist, :from => 'stylist_id')
  click_on('Change')
end

def update_stylists(name, new_name)
  visit('/owner/stylists')
  click_on(name)
  fill_in("stylist_name", :with => new_name)
  click_on("Change")
end



describe('viewing salon system home page', {:type => :feature}) do

  it('allows the viewing of the home page where you can choose what user you are') do
    visit('/')
    expect_page(["Welcome to Matts Salon!", "proceed as owner"])
  end

  it('allows the owner to add a stylist and then delete them') do
    create_stylist("name")
    delete_stylists("name")
    expect_page(["go out and get more workers"])
  end

  it('allows the owner to create a new stylist') do
    create_stylist('matthew')
    expect_page(['matthew'])
  end

  it('allows the owner to add a create a new stylist and then create a client who get their hair cut from the stylist') do
    create_stylist('louis')
    create_clients("mark", "louis")
    expect_page(['mark', 'list of clients'])
  end

  it("allows the owner to update the stylist's name") do
    create_stylist("mark")
    update_stylists("mark", "matthew")
    expect_page(['matthew'])
  end

  it('allows the owner to update the clients name and stylist') do
    create_stylist("mark")
    create_stylist("matthew")
    create_clients("jim", "mark")
    update_client("jim", 'richard', "matthew")
    expect_page(['list of clients', 'richard'])
  end

  it("allows the owner to delete a client") do
  create_stylist("mark")
  create_clients("jim", "mark")
  delete_clients("jim")
  expect_page(["go out and get more clients"])
  end

end
