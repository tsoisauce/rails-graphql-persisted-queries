module Types
  class ProductType < Types::BaseObject
    field :id, ID, null: false
    field :title, String, null: false
    field :description, String, null: true
    # field :user, String, null: false
    field :user, Types::UserType, null: false
  end
end
