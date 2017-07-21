class Post
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic

  # Fields
  field :title, type: String, default: ""

  #Associations
  belongs_to :user
  has_many :contents, dependent: :delete
end
