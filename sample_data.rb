# frozen_string_literal: true

# Sample static data for demo purposes

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
