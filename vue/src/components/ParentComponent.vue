<template>
    <HomeView :searchResults="searchResults" @querySubmitted="handleQuery" />
    <SearchComponent :query="currentQuery" @searchCompleted="handleSearchResults" />
</template>
  
<script>
import HomeView from '../views/HomeView.vue';
import SearchComponent from '../components/SearchAndFilter.vue';

export default {
    components: { HomeView, SearchComponent },
    data() {
        return {
            currentQuery: '',
            searchResults: [] //stores the search results
        };
    },
    methods: {
        handleQuery(query) {
            this.currentQuery = query;
        },
        handleSearchResults(results) {
            this.searchResults = results;//updates the search results
        }
    }
};
