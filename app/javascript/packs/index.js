import React from 'react';
import { render } from 'react-dom';
import Provider from '../components/Provider';
import App from '../components/App';

/*
Rails controller and routes point to this.  All components and providers must be imported in.
*/

render(
  <Provider>
    <App />
  </Provider>,
  document.querySelector('#root')
);