# frozen_string_literal: true

require 'json'

PRODUCTS = [
  {
    id: 1,
    title: 'Widget 1',
    description: 'This is description for Widget 1.',
    user: {
      id: 1,
      email: 'jane.doe@example.com',
      first_name: 'Jane',
      last_name: 'Doe'
    }
  },
  {
    id: 2,
    title: 'Widget 2',
    description: 'This is a description for Widget 2',
    user: {
      id: 2,
      email: 'john.doe@example.com',
      first_name: 'John',
      last_name: 'Doe'
    }
  }
].freeze

module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # test query
    field :test_field, String, null: false,
                               description: 'An example field added by the generator'
    def test_field
      'Hello World!'
    end

    # all products query
    field :products, [Types::ProductType], null: false, description: 'Returns a list of products'
    def products
      PRODUCTS
    end

    # all users query
    field :users, [Types::UserType], null: false, description: 'Returns a list of users'
    def users
      PRODUCTS.map { |product| product[:user] }
    end

    # query by user email
    field :user_by_email, [Types::UserType], null: false, description: 'Returns a user by email' do
      argument :email, String, required: true
    end

    def user_by_email(email:)
      filtered_product_by_user = PRODUCTS.select { |product| product[:user][:email] == email }
      filtered_product_by_user.map { |product| product[:user] }
    end
  end
end
