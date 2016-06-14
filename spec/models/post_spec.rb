require 'rails_helper'

RSpec.describe Post, type: :model do
  context 'validates a new post' do
    let (:author) { Author.new()}
    it 'creates a post with title, body, and author' do
      post = Post.new(title: 'Title', body: 'Body!', author: author)
      expect(post).to be_valid
    end
  end
end
