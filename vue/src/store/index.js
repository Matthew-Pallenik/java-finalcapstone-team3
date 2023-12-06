import { createStore as _createStore } from 'vuex';
import axios from 'axios';
import PathwayService from '../services/PathwayService';

export function createStore(currentToken, currentUser) {
  let store = _createStore({
    state: {
      token: currentToken || '',
      user: currentUser || {}
    },
    mutations: {
      SET_AUTH_TOKEN(state, token) {
        state.token = token;
        localStorage.setItem('token', token);
        axios.defaults.headers.common['Authorization'] = `Bearer ${token}`;
      },
      SET_USER(state, user) {
        state.user = user;
        localStorage.setItem('user', JSON.stringify(user));
      },
      LOGOUT(state) {
        localStorage.removeItem('token');
        localStorage.removeItem('user');
        state.token = '';
        state.user = {};
        axios.defaults.headers.common = {};
      },
      SET_SEARCH_RESULTS(state, results) {
        state.searchResults = results;
      },
      
    },
    actions: {
      async performSearch({ commit }, query) {
        try {
          const keywords = query.split(/\s+/); // Split the query into individual words
          let allResults = [];
    
          for (const key of keywords) {
            const response = await PathwayService.addUserInput(key);
            allResults.push(...response.data); // Assuming each response is an array of results
          }
    
          // Combine and possibly de-duplicate results here, if necessary
          commit('SET_SEARCH_RESULTS', allResults);
        } catch (error) {
          console.error('Search error:', error);
        }
      },
    }
  });
  return store;
}
