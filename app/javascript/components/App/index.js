import React from 'react';
import { Query } from 'react-apollo';
import { ProductQuery } from "./operations.graphql";

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