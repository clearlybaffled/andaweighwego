require 'rails_helper'

RSpec.describe "authors/new", type: :view do
  before(:each) do
    assign(:author, Author.new(
      :name => "MyString",
      :username => "MyString",
      :password => ""
    ))
  end

  it "renders new author form" do
    render

    assert_select "form[action=?][method=?]", authors_path, "post" do

      assert_select "input#author_name[name=?]", "author[name]"

      assert_select "input#author_username[name=?]", "author[username]"

      assert_select "input#author_password[name=?]", "author[password]"
    end
  end
end
