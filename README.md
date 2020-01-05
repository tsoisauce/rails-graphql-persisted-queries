# Rails GraphQL Persisted Queries

Ruby on Rails project to demo HTTP caching strategies.

Note: `master` branch will not utalize active record to persist data. All data will be static for demostration purposes.

## Installation

- Bundle install: `bundle`
- Webpack install: `rails webpacker:install`
- Yarn install: `yarn`
- GraphQL install: `rails generate graphql:install`

## GraphiQL

Make sure the following is included in `app/assets/config/manifest.js`

```js
//= link graphiql/rails/application.js
//= link graphiql/rails/application.css
```

### Adding new Type Definitions

```bash
rails g graphql:object <object-name>
```

This will generate Type Defition to describe the shape of your data in `app/graphql/types/<object-name>_type.rb`

## Run Server

To start Rails server: `rails s`

visit [`localhost:3000/graphiql`](http://localhost:3000/graphiql) for GraphiQL
visit [`localhost:3000`](http://localhost:3000) for React App
