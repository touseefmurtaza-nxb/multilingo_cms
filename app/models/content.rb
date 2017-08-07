class Content
  include Mongoid::Document

  ## Fields
  field :language, type: String
  field :body, type: String

  ## Associations
  belongs_to :post

  LANGUAGE = {'English'=>'en','Denmark'=>'de'}
end
