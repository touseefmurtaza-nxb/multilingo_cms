class Content
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic

  # Fields
  field :language, type: String, default: "english"
  field :body, type: String, default: ""

  #Associations
  belongs_to :post
end
