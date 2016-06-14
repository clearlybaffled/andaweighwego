require 'rails_helper'

RSpec.describe "posts/index", type: :view do
  before(:each) do
    assign(:posts, [
      Post.create!(
        :title => "Title",
        :body => "MyText",
        :slug => "Slug",
        :author_id => "Author"
      ),
      Post.create!(
        :title => "Title",
        :body => "MyText",
        :slug => "Slug",
        :author_id => "Author"
      )
    ])
  end

  it "renders a list of posts" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Slug".to_s, :count => 2
    assert_select "tr>td", :text => "Author".to_s, :count => 2
  end
end