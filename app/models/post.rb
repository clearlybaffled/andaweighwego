class Post < ActiveRecord::Base
  belongs_to :author
  validates :title, presence: true
  validates :body, presence: true
  validates :author, presence: true
  validates :posted_at, presence: true


  def build_slug
    "#{posted_at.strftime("%Y/%m/%d")}/#{[id,title.parameterize].join('-')}"
  end

  def to_param
    slug
  end
end

