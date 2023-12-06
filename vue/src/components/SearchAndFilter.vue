<!--Create search logic
    Breaks the users input into an array 
    uses the new array to send over each word in the array and search the key word
    at the end point-->

<!-- Process the response(results)
    count keyword matches
    filter and prioritize the results based on keyword matches-->

<!--Make a display template for the results-->

<!-- Out put the results-->

<template>
    <div>
        <div v-if="isLoading">Loading...</div>
        <div v-else>
            <div v-if="searchResults && searchResults.length > 0">
                <div v-for="(result, index) in searchResults" :key="index">
                    <h3>{{ result.title }}</h3>
                    <p>{{ result.description }}</p>
                    <a :href="result.link" target="_blank">Learn More</a>
                </div>
            </div>
            <div v-else>No results found.</div>
        </div>
    </div>
</template>
  
<script>
import { mapState, mapActions } from 'vuex';

export default {
    data() {
        return {
            isLoading: false
        };
    },
    computed: {
        ...mapState(['searchResults']),
    },
    methods: {
        ...mapActions(['performSearch']),
        async processSearch(query) {
            this.isLoading = true;
            try {
                await this.performSearch(query);
            } catch (error) {
                console.error('Search error:', error);
            } finally {
                this.isLoading = false;
            }
        },
    },
    watch: {
        query(newQuery) {
            if (newQuery) {
                this.processSearch(newQuery);
            }
        }
    },
    props: ['query'],
};
</script>