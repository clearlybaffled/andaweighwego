require 'rails_helper'

RSpec.describe "authors/index", type: :view do
  before(:each) do
    assign(:authors, [
      Author.create!(
        :name => "Name",
        :username => "Username",
        :password => ""
      ),
      Author.create!(
        :name => "Name",
        :username => "Username",
        :password => ""
      )
    ])
  end

  it "renders a list of authors" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Username".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
