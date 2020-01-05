import React from 'react';
import { Query } from 'react-apollo';
import gql from 'graphql-tag';

const ProductQuery = gql`
  {
    products {
      id
      title
      user {
        email
      }
    }
  }
`;

export default () => (
  <Query query={ProductQuery}>
    {({ data, loading }) => (
      <div>
        {loading
          ? 'loading...'
          : data.products.map(({ title, id, user }) => (
              <div key={id}>
                <b>{title}</b> {user ? `added by ${user.email}` : null}
              </div>
            ))}
      </div>
    )}
  </Query>
);