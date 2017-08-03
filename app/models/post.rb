class Post
  include Mongoid::Document

  ## Fields
  field :title, type: String

  ## Associations
  belongs_to :user
  has_many :contents, dependent: :delete
end
