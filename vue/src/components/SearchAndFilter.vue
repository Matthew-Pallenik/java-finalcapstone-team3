
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
      <!-- Loading Indicator -->
      <div v-if="isLoading">
        Loading...
      </div>
  
      <!-- Search Results -->
      <div v-else>
        <!-- Check if there are results -->
        <div v-if="results.length > 0">
          <!-- Loop through each result and display it -->
          <div v-for="(result, index) in results" :key="index">
            <h3>{{ result.title }}</h3>
            <p>{{ result.description }}</p>
            <a :href="result.link" target="_blank">Learn More</a>            
            <!-- You can add more details based on your result structure -->
          </div>
        </div>
        <!-- Message if No Results are Found -->
        <div v-else>
          No results found.
        </div>
      </div>
    </div>
  </template>

<script>
import pathwayService from '../services/PathwayService';

export default {
    data() {
        return {
            results: [],    // Array to store search results
            isLoading: false // Boolean to track loading state
        };
    },
    props: ['query'],
    watch: {
        query(newQuery) {
            if (newQuery) {
                this.processSearch(newQuery);
            }
        }
    },
    methods: {
        async processSearch(query) {
            this.isLoading = true;
            // Splits the query into an array of strings
            const keyWords = query.split(/[\s,.?]+/);

            try {
                let allResponses = [];
                // Fetches results from API
                for (const key of keyWords) {
                    const response = await pathwayService.addUserInput(key);
                    allResponses.push(response.data);
                }

                // Process and prioritize all responses
                this.results = this.processAllResponses(allResponses, keyWords);
                this.$emit('searchCompleted', this.results); // Emit the event with the results

            } catch (error) {
                console.error('Search error:', error);
            } finally {
                this.isLoading = false;
            }
        },

        processAllResponses(allResponses, keyWords) {
            // Flatten the array of arrays
            let flattenedResults = allResponses.flat();

            // Count keyword matches for each result
            flattenedResults = flattenedResults.map(result => {
                let keywordCount = 0;
                keyWords.forEach(keyWord => {
                    if (result.keywords && result.keywords.includes(keyWord)) {
                        keywordCount++;
                    }
                });
                return { ...result, keywordCount };
            });

            // Sort results based on keyword count
            flattenedResults.sort((a, b) => b.keywordCount - a.keywordCount);

            return flattenedResults;
        }
    }
}
</script>

<style scoped>
</style>