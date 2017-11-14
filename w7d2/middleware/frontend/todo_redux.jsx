import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';

import Root from './components/root';

// const addLoggingToDispatch = (store) => {
//   let storeDispatch = store.dispatch;
//   return (action) => {
//     console.log(store.getState());
//     console.log(action);
//     storeDispatch(action);
//     console.log(store.getState());
//   };
// };

// function addLoggingToDispatch(store) {
//   let storeDispatch = store.dispatch;
//   return function(next) {
//     return function(action) {
//       console.log((store.getState()));
//       console.log(action);
//       storeDispatch(action);
//       console.log(store.getState());
//       return next(action);
//     };
//   };
// }

// const addLoggingToDispatch = store => next => action => {
//   let storeDispatch = store.dispatch;
//   let result = next(action);
//   console.log(store.getState());
//   console.log(action);
//   storeDispatch(action);
//   console.log(store.getState());
//   return result;
// };
//
// const applyMiddlewares = (store, ...middlewares) => {
//   let dispatch = store.dispatch;
//   middlewares.forEach( (middleware) => {
//     dispatch = middleware(store)(dispatch);
//   });
//   return Object.assign({}, store, { dispatch });
// };

document.addEventListener('DOMContentLoaded', () => {
  const preloadedState = localStorage.state ?
    JSON.parse(localStorage.state) : {};
  let store = configureStore(preloadedState);
  // store = applyMiddlewares(store, addLoggingToDispatch);

  // store.dispatch = addLoggingToDispatch(store);

  const root = document.getElementById('content');
  ReactDOM.render(<Root store={store} />, root);
});
