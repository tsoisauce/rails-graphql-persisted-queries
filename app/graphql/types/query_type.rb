# frozen_string_literal: true

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

    # products query
    field :products, [Types::ProductType], null: false, description: 'Returns a list of products'
    def products
      [
        {
          id: 1,
          title: 'Widget 1',
          description: 'This is description for Widget 1.'
        },
        {
          id: 2,
          title: 'Widget 2',
          description: 'This is a description for Widget 2'
        }
      ]
    end
  end
end
