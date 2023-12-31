<template>
  <div class="home grid-container">
    <!-- Top Row -->
    <!-- TE Logo on the top-left -->
    <div class="grid-item logo">
      <img src="img/Gary-LOGO.png" alt="TE Logo">
    </div>

    <!-- Welcome Message in the top-center -->
    <div class="grid-item welcome">
      <!-- If userName is not set, welcome the user and ask for the user's name -->
      <div v-if="!userName">
        <h1>Welcome to Ask Gary</h1>
        <h2 class="naming">What would you like me to call you?</h2>
        <input type="text" v-model="preferredName" @keyup.enter="saveName" class="initial-input"
          placeholder="Enter your name here">
      </div>

      <!-- If userName is set, display a personalized welcome message and ask what the user needs help with -->
      <div v-else>
        <h1>Welcome to Ask Gary, {{ userName }}</h1>
        <h2>What would you like help with?</h2>
      </div>
    </div>
    <!-- Placeholder for the top-right content -->
    <div class="grid-item right-top-placeholder">
      <!-- Future content or additional features can go here -->
    </div>

    <!-- Middle Row -->
    <div class="grid-item home-nav">
      <!-- Navigation links like Home/Logout will be placed here -->
      <!-- Existing navigation functionality should be transferred here -->

      <ul>
        <li><router-link v-bind:to="{ name: 'home' }" class="nav-link">Home</router-link></li>
        <li><router-link v-bind:to="{ name: 'Pathway' }" class="nav-link">Pathway</router-link></li>
        <li><router-link v-bind:to="{ name: 'Curriculum' }" class="nav-link">Curriculum</router-link></li>
        <li><router-link v-bind:to="{ name: 'Jobs' }" class="nav-link">Jobs</router-link></li>
        <li><router-link v-bind:to="{ name: 'AskForHelp' }" class="nav-link">Ask For Help</router-link></li>
        <li><router-link v-bind:to="{ name: 'AboutUs' }" class="nav-link">About Us</router-link></li>
        <li><router-link v-bind:to="{ name: 'logout' }" v-if="$store.state.token != ''"
            class="nav-link">Logout</router-link></li>
      </ul>
    </div>

    <!-- Q.A Container and Input Box in the middle-center -->
    <div class="grid-item qa-section">
      <!-- Container for displaying Q&A history -->
      <div v-if="userName" class="qa-container">
        <!-- Iterates over each item in qaHistory to display questions and answers -->
        <div v-for="(item, index) in qaHistory" :key="index" class="qa-message">
          <p class="question">{{ item.question }}</p>
          <div v-if="typeof item.answer === 'object'">
            <p class="title">
              <span class="label">Title: </span>
              <span class="content">{{ item.answer.title }}</span>
            </p>
            <p class="description">
              <span class="label">Description: </span>
              <span class="content">{{ item.answer.description }}</span>
            </p>
            <p class="link">
              <span class="label">Link: </span>
              <span class="content">
                <a :href="item.answer.link" target="_blank">{{ item.answer.link }}</a>
              </span>
            </p>
          </div>
          <p v-else class="answer">{{ item.answer }}</p>
        </div>
      </div>
      <!-- Input Box for user to ask questions -->
      <div v-if="userName" class="input-box">
        <input type="text" v-model="userQuery" @keyup.enter="processQuery" placeholder="Ask me anything...">
      </div>

    </div>

    <!-- Placeholder for the motivational quote in the middle-right -->
    <div class="grid-item middle right">
      <!-- Motivational quote can be dynamically inserted here -->


    </div>

    <!-- Bottom Row -->
    <!-- Placeholder for the bottom-left content -->
    <div class="grid-item bottom-left-placeholder">
      <!-- This can be left empty or used for future content -->
    </div>

    <!-- Skyline image in the bottom-center -->

    <!-- Placeholder for the bottom-right content -->
    <div class="grid-item bottom-right-placeholder">
      <!-- This can be left empty or used for future content -->
    </div>
  </div>

  <div class="grid-item footer">
    <h2 class="need-motivation">Need Motivation?</h2>
    <h2 class="motivational-quote">{{ this.quote }}</h2>
    <h3 class="quote-author"> - {{ quoteAuthor }}</h3>


  </div>
</template>
<script>
import { mapState, mapActions } from 'vuex';
import QuoteService from '../services/QuoteService';

export default {
  mounted() {
    document.title = "Home";
    this.fetchRandomQuote();
  },

  computed: {
    ...mapState(['searchResults']), // Map the searchResults from Vuex state
  },

  data() {
    return {
      preferredName: '', // Store the user's preferred name
      userName: '',
      quote:'',
      quoteAuthor:'',
      userQuery: '',
      qaHistory: [] // Array to hold the history of Q&A
    };
  },
  created() {
    // When the component is created, check for a search query parameter and process it
    this.checkRouteForSearchQuery();

    // Set the preferredName from the Vuex store if available
    if (!this.userName) {
      this.userName = this.$store.state.preferredName;
    }

  },

  methods: {
    ...mapActions(['performSearch']), // Map the performSearch action from Vuex

    saveName() {
      this.userName = this.preferredName.trim();
      this.$store.commit('SET_PREFERRED_NAME', this.userName);
    },
    fetchRandomQuote() {
      QuoteService.getRandomQuote()
        .then((response) => {
          const quotesArray = response.data;
          if (quotesArray && quotesArray.length > 0) {
            this.quote = quotesArray[0].quote;
            this.quoteAuthor = quotesArray[0].author;

          } else {
            console.error('No quotes found in the response.');
          }
        })
        .catch((error) => {
          console.error('Error fetching quote:', error);
        });
    },
    //this checks for a query form another view
    checkRouteForSearchQuery() {
      const searchQuery = this.$route.query.search;
      if (searchQuery) {
        this.userQuery = searchQuery;
        // Use the updated processQuery method
        this.processQuery();
      }
    },
    scoreAndSort() {
      console.log("Scoring and Sorting Action Called");

      let scoredResults = [...this.$store.state.searchResults];

      for (let result of scoredResults) {
        let score = 0;

        // Split the title into words for individual comparison
        const titleWords = result.title ? result.title.toLowerCase().split(/\s+/) : [];

        for (let keyword of this.$store.state.queryKeywords) {
          // Check each word in the title
          if (titleWords.includes(keyword.toLowerCase())) {
            score += 10;
          }

          // Check in keywords (splitting by '|')
          if (result.key) {
            let resultKeywords = result.key.split('|').map(kw => kw.trim().toLowerCase());
            if (resultKeywords.includes(keyword.toLowerCase())) {
              score += 5;
            }
          }
        }

        // Update the result's score
        result.score = score;
      }

      // Sort the results by score in descending order
      scoredResults.sort((a, b) => b.score - a.score);

      console.log("Scored and Sorted Results:", scoredResults);

      // Commit the sorted results to the store
      this.$store.commit('SET_SEARCH_RESULTS', scoredResults);
    },

    async processQuery() {
      // Check if the userQuery is empty. If it is, exit the function early.
      if (!this.userQuery) return;

      // Add a placeholder answer to the Q&A history indicating that the search is in progress.
      const placeholderAnswer = 'Processing your request...';
      this.qaHistory.push({ question: this.userQuery, answer: placeholderAnswer });

      // Process the query into keywords and store them in Vuex state
      await this.$store.dispatch('processQuery', this.userQuery);

      // Perform the search using the stored keywords
      await this.$store.dispatch('performSearch');
      this.scoreAndSort();

      // Check if there are search results and format them accordingly.
      // If there are search results, store only the first result as an object.
      // The object contains the title, description, and link of the first result.
      const formattedResult = this.searchResults.length > 0
        ? {
          title: this.searchResults[0].title,
          description: this.searchResults[0].description,
          link: this.searchResults[0].link
        }
        : 'No results found.';

      // Update the latest answer in qaHistory with the formatted search result.
      this.qaHistory[this.qaHistory.length - 1].answer = formattedResult;

      // Reset the user query input field to be ready for a new query.
      this.userQuery = '';
    }
  },

  watch: {

    // Watch for changes in the route, especially for the 'search' query parameter
    $route(to, from) {
      // If the route change involves a change in the search query, process the new query
      if (to.query.search !== from.query.search) {
        this.userQuery = to.query.search || ''; // Set the userQuery to the new query or an empty string

        // Instead of calling processQuery directly, call a method that handles the entire search process
        this.processSearch(this.userQuery);
      }
    },
  },
};
</script>


<!--added scoped here so this css doesn't affect other css views-->
<style scoped>
/* Layout for the entire grid */
/* .home.grid-container{
  min-block-size: 100vb;
  background-image: linear-gradient(
    to right bottom, 
  rgb(214, 135, 226), 
  rgb(204, 120, 120), 
  rgb(218, 137, 71));
} */
.grid-container {
  display: grid;
  grid-template-columns: 1fr 3fr 1fr;
  grid-template-rows: auto;
  gap: 20px;
  align-items: start;
  grid-template-areas:
    "logo welcome right-top-placeholder"
    "nav qa-section motivational-quotes"
    "footer footer footer";
  background-image: url('img/Cleveland-90s.png');
  /* Set the skyline image as the background */
  background-size: 145%;
  /* Cover the entire container with the background image */
  background-position: center calc(100% + 550px);
  /* Center the background image and position it below the bottom of the grid */
  background-repeat: no-repeat;
  /* Do not repeat the background image */

}

.naming {
  text-align: center;
}

/* Assign grid area names to the children */
.logo {
  grid-area: logo;
}

.welcome {
  grid-area: welcome;
}

.right-top-placeholder {
  grid-area: right-top-placeholder;
}

.home-nav {
  grid-area: nav;
}

.qa-section {
  grid-area: qa-section;
}




/* Styling for the logo to make it smaller and align properly */
/* Styling for the logo container */
/* Styling for the logo container */
.grid-item.logo {
  /* Center the logo within its grid cell */
  display: flex;
  justify-content: center;
  align-items: center;
  margin-top: 0px;  
  filter: drop-shadow(-1px -1px 1px #b5b6b8);
  /* Shadow effect for depth */
  max-width: 100%; /* Add this line to restrict the width of the container */
}

/* Styling for the logo image */
.grid-item.logo img {
  /* You may set a max-width instead if the image is too large */
  /* Maintain aspect ratio */
  /* Remove max-height if it's not needed or adjust accordingly */
  max-width: 100%; /* Add this line to restrict the width of the image */
}


/* Welcome message styling */
/* Styling for the welcome message container */
/* Styling for the welcome container */
.welcome {
  display: flex;
  /* Use Flexbox for alignment */
  flex-direction: column;
  /* Stack elements vertically */
  justify-content: flex-start;
  /* content vertically */
  align-items: center;
  /* Center content horizontally */
  text-align: center;
  /* Ensure text is centered */
  grid-column: 1 / -1;
  /* Span across all columns */
  margin-top: 0;
  /* Remove top margin to bring closer to the top */
  padding-top: 1em;
  /* Add padding to space it from the top edge */
  color: whitesmoke;
  text-shadow: 2px 2px 4px rgba(66, 65, 65, 0.4);
}

/* Styling for h1 inside the welcome container */
/* Styling for h1 inside the welcome container */
/* Styling for h1 inside the welcome container */
.welcome h1 {
  font-size: 45px;
  /* Size relative to the viewport width */
  margin-top: 0;
  /* Remove top margin to bring closer to the top */
  margin-bottom: 0;
  /* Spacing between h1 and h2 */
  font-family: prompt;
}

/* Styling for the prompt beneath the welcome message */
.welcome h2 {
  font-size: 45px;
  /* Slightly smaller than the h1 */
  margin-top: 0;
  /* Remove top margin to reduce space */
  margin-bottom: 0.5em;
  /* Consistent spacing */
  font-family: prompt;
}

/* Align navigation links to the left */
.home-nav {
  display: flex;
  justify-content: center;
  padding: 10px;
  margin-top: 20px;
  margin-left: 65px;
  margin-right: 50px;
  font-size: 25px;
  background-color: hsla(0, 2%, 46%, 0.5);
  border-radius: 0.5rem;
}

.home-nav a {
  color: #ffffff;
  text-decoration: none;
  font-family: prompt;
  transition: color 0.2s ease-in-out;
}

.home-nav a:hover {
  color: #1dd3da;

}

li {
  display: list-item;
  list-style-type: none;
  padding: 10px;
}

ul {
  white-space: nowrap;
}


/* Styling for the initial input box */
.initial-input {
  width: 800px;
  /* Adjust width considering the padding */
  height: 50px;
  /* Standard input height */
  padding: 0 15px;
  /* Padding inside the input */
  font-size: 1rem;
  /* Standard font size */
  font-family: prompt;
  border-radius: 8px;
  /* Rounded corners */
  border: none;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.2);
  /* Shadow for depth */
  margin-top: 10px;
  /* Space above the input box */

}

/* Styling for the placeholder text in input */
.input-box input[type="text"]::placeholder,
.initial-input::placeholder {
  color: #999;
  /* Change the color to a desired color */
  font-family: prompt;
  font-style: italic;
  /* Apply italic font style */
  /* You can also adjust other properties like font-size, font-weight, etc. */
}

/* QA Section specific styles */
.qa-section {
  display: flex;
  flex-direction: column;
  align-items: center;
  /* Center the children horizontally */
  width: 80%;
  /* Set a max width for the Q&A section */
  max-width: 100%;
  /* Ensure this does not exceed the viewport width */
  margin: auto;
  /* Center the section in the grid area */
  margin-bottom: 0px;
}

/* QA Container specific styles */
.qa-container {
  background-color: rgba(255, 255, 255, .95);
  /* Semi-transparent white */
  border-radius: 15px;
  /* Rounded corners */
  padding: 20px;
  /* Padding inside the container */
  /* margin-bottom: 10px; Space between the QA container and the input box */
  width: 800px;
  /* Full width of the qa-section */
  height: 450px;
  /* Fixed height with scrolling */
  overflow-y: auto;
  /* Scrollbar for overflow content */
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
  /* Shadow for depth */
}

.question {
  font-family: prompt;
  font-size: 20px;
  color: var(--color-light-purple);
}

.label {
  font-family: prompt;
  font-size: 20px;
  color: var(--color-light-purple);
}

span {
  font-family: prompt;
  font-size: 20px;
  color: var(--color-light-blue);
}

/* Input box styling */
.input-box input[type="text"] {
  width: 800px;
  /* Adjust width considering the padding */
  height: 50px;
  /* Standard input height */
  padding: 0 15px;
  /* Padding inside the input */
  font-size: 1rem;
  /* Standard font size */
  border-radius: 8px;
  /* Rounded corners */
  border: none;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.2);
  /* Shadow for depth */
  margin-top: 10px;
  /* Space above the input box */
  margin-bottom: 0px;
}

.footer {
  grid-area: footer;
  background-color: #131c5a;
  /* Blue color for the footer */
  height: 30vh;
  /* Set the desired height for the footer */
  display: grid;
  text-align: center;
  justify-content: center;
  align-items: center;
  color: white;
  /* Text color for the footer content */
  font-family: prompt;
  grid-template-columns: 1fr;
  grid-template-areas:
   "need-motivation"
   "motivation-quote"
   "quote-author";
}
.need-motivation{
  gap: 0;
  margin-top: 35px;
  margin-bottom: 0px;
  padding: 0px;
}
h3.motivational-quote{
  gap: 0;
  margin-top: 0px;
  margin-bottom: 0px;
  margin-left: 150px;
  margin-right: 150px;
  padding: 0px;
}
h3.quote-author{
  gap: 0;
  margin-top: 0px;
  margin-bottom: 70px;
  padding: 0px;
}

/* Styling for the skyline image, serving as the footer visually */</style>