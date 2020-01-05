# Rails GraphQL Persisted Queries

Ruby on Rails project to demo HTTP caching strategies.

## Installation

Bundle install

```bash
bundle
```

Webpack install

```bash
rails webpacker:install
```

Yarn install

```bash
yarn
```

GraphQL install (if needed)

```bash
rails generate graphql:install
```

## GraphiQL

Make sure the following is included in `app/assets/config/manifest.js`

```js
//= link graphiql/rails/application.js
//= link graphiql/rails/application.css
```

## Run Server

To start Rails server:

```bash
rails s
```

visit `localhost:3000/graphiql` for GraphiQL interface
