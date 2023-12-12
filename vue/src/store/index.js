import { createStore as _createStore } from 'vuex';
import axios from 'axios';
import PathwayService from '../services/PathwayService';
import CurriculumService from '../services/CurriculumService';
import JobsService from '../services/JobsService';

export function createStore(currentToken, currentUser) {
  let store = _createStore({
    state: {
      token: currentToken || '',
      user: currentUser || {},
      pathways: [],      
      preferredName: '', // Store the user's preferred name
      curriculums: [],
      jobs:[],
      queryKeywords: [] //this is the user query broken into a array to be used in other methods like the perform search and filterResults.
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
      SET_PATHWAYS(state, pathways) {
        state.pathways = pathways.map(pathway => ({
          ...pathway,
          originalId: pathway.id, // Preserve the original ID
          id: `p${pathway.id}`, // Adding unique identifier
          score: 0 // Initializing score
        }));
      }, 
      SET_CURRICULUM(state, curriculums){
        state.curriculums = curriculums.map(curriculum => ({
          ...curriculum,
          originalId: curriculum.id, // Preserve the original ID
          id: `c${curriculum.id}`, // Adding unique identifier
          score: 0 // Initializing score
        }));
      },
      SET_JOB(state,jobs){
        state.jobs = jobs.map(job => ({
          ...job,
          originalId: job.id,
          id: `j${job.id}`,
          score: 0
        }));
      },
      SET_PREFERRED_NAME(state, name) {
        state.preferredName = name;
      },
      SET_QUERY_KEYWORDS(state, keywords) {
        state.queryKeywords = keywords;
      },
      
    },   
    
    actions: {
      // New action to process the query into keywords and store them
      processQuery({ commit }, query) {
        // Remove punctuation and split the query into individual words
        const keywords = query.replace(/[.,/#!$%^&*;:{}=\-_`~()?]/g, '')
                              .replace(/\s{2,}/g, ' ')
                              .toLowerCase()
                              .split(/\s+/);
        commit('SET_QUERY_KEYWORDS', keywords);
      },

      // Modified performSearch action
      async performSearch({ commit, state }) {
        try {
          let pathway = [];
          let curriculum = [];
          let job = [];

          for (const key of state.queryKeywords) {
            const pathwayResponse = await PathwayService.addUserInput(key);
            pathway.push(...pathwayResponse.data);
            commit('SET_PATHWAYS', pathway);

            const curriculumResponse = await CurriculumService.addUserInput(key);
            curriculum.push(...curriculumResponse.data);
            commit('SET_CURRICULUM', curriculum);

            const jobsResponse = await JobsService.addUserInput(key);
            job.push(...jobsResponse.data);
            commit('SET_JOB', job)
          }

          // Use the getter to get the combined results
          let allResults = [...state.pathways, ...state.curriculums, ...state.jobs];

          // Commit the combined results
          commit('SET_SEARCH_RESULTS', allResults);
        } catch (error) {
          console.error('Search error:', error);
        }
      },

      async fetchRandomPathways({ commit }) {
        try {
          const totalItems = 21; // Total number of items available
          const numberOfItemsToFetch = 9; // Number of items to display
          let selectedIds = new Set();
      
          // Randomly pick unique IDs
          while (selectedIds.size < numberOfItemsToFetch) {
            const randomId = Math.floor(Math.random() * totalItems) + 1;
            selectedIds.add(randomId);
          }
      
          let pathways = [];
          for (let id of selectedIds) {
            const response = await PathwayService.getResultById(id);
            pathways.push(response.data);
          }
      
          // Assuming each response.data is an individual pathway item
          commit('SET_PATHWAYS', pathways);
        } catch (error) {
          console.error('Error fetching random pathways:', error);
        }
      },
      async fetchRandomCurriculum({ commit }) {
        try {
          const totalItems = 41; // Total number of items available(this may change when curriculum table is fully populated)
          const numberOfItemsToFetch = 9; // Number of items to display
          let selectedIds = new Set();
      
          // Randomly pick unique IDs
          while (selectedIds.size < numberOfItemsToFetch) {
            const randomId = Math.floor(Math.random() * totalItems) + 1;
            selectedIds.add(randomId);
          }
      
          let curriculums = [];
          for (let id of selectedIds) {
            const response = await CurriculumService.getResultById(id);
            curriculums.push(response.data);
          }
      
          // Assuming each response.data is an individual pathway item
          commit('SET_CURRICULUM', curriculums);
        } catch (error) {
          console.error('Error fetching random curriculum:', error);
        }
      },
      async fetchRandomJobs({ commit }) {
        try {
          const totalItems = 14; // Total number of items available(this may change when curriculum table is fully populated)
          const numberOfItemsToFetch = 14; // Number of items to display
          let selectedIds = new Set();
      
          // Randomly pick unique IDs
          while (selectedIds.size < numberOfItemsToFetch) {
            const randomId = Math.floor(Math.random() * totalItems) + 1;
            selectedIds.add(randomId);
          }
      
          let jobs = [];
          for (let id of selectedIds) {
            const response = await JobsService.getResultById(id);
            jobs.push(response.data);
            console.log(jobs);
            
          }
      
          // Assuming each response.data is an individual pathway item
          commit('SET_JOB', jobs);
        } catch (error) {
          console.error('Error fetching random jobs:', error);
        }
      }
    }
  });
  return store;
}
