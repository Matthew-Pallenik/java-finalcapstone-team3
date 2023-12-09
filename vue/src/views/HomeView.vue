<template>
  <div class="home grid-container">
    <!-- Top Row -->
    <!-- TE Logo on the top-left -->
    <div class="grid-item logo">
      <img src="img/TE-LOGO-green-blue.png" alt="TE Logo">
    </div>

    <!-- Welcome Message in the top-center -->
    <div class="grid-item welcome">
      <!-- If userName is not set, welcome the user and ask for the user's name -->
      <div v-if="!userName">
        <h1>Welcome to Chatbot</h1>
        <h2>What would you like me to call you?</h2>
        <input type="text" v-model="preferredName" @keyup.enter="saveName" class="initial-input"
          placeholder="Enter your name here">
      </div>

      <!-- If userName is set, display a personalized welcome message and ask what the user needs help with -->
      <div v-else>
        <h1>Welcome to Chatbot, {{ userName }}</h1>
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
        <li><router-link v-bind:to="{name: 'Pathway'}" class="nav-link">Pathway</router-link></li>
        <li><router-link v-bind:to="{name: 'Curriculum'}" class="nav-link">Curriculum</router-link></li>
        <li><router-link v-bind:to="{name: 'Jobs'}" class="nav-link">Jobs</router-link></li>
        <li><router-link v-bind:to="{name: 'AskForHelp'}" class="nav-link">Ask For Help</router-link></li>
        <li><router-link v-bind:to="{ name: 'logout' }" v-if="$store.state.token != ''" class="nav-link">Logout</router-link></li>
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
    <div class="grid-item motivational-quote">
      <!-- Motivational quote can be dynamically inserted here -->

    </div>

    <!-- Bottom Row -->
    <!-- Placeholder for the bottom-left content -->
    <div class="grid-item bottom-left-placeholder">
      <!-- This can be left empty or used for future content -->
    </div>

    <!-- Skyline image in the bottom-center -->
    <div class="grid-item skyline">
      <img src="img/Cleveland-90s.png" alt="City Skyline">
    </div>

    <!-- Placeholder for the bottom-right content -->
    <div class="grid-item bottom-right-placeholder">
      <!-- This can be left empty or used for future content -->
    </div>
  </div>
</template>
<script>
import { mapState, mapActions } from 'vuex';

export default {
  mounted() {
    document.title = "Home";
  },

  computed: {
    ...mapState(['searchResults']), // Map the searchResults from Vuex state
  },

  data() {
    return {
      preferredName: '', // Store the user's preferred name
      userName: '',
      userQuery: '',
      qaHistory: [] // Array to hold the history of Q&A
    };
  },
  created() {
    // When the component is created, check for a search query parameter and process it
    this.checkRouteForSearchQuery();

    // Set the preferredName from the Vuex store if available
    if(!this.userName){
      this.userName = this.$store.state.preferredName;
    }
    
  },

  methods: {
    ...mapActions(['performSearch']), // Map the performSearch action from Vuex

    saveName() {
      this.userName = this.preferredName.trim();   
      this.$store.commit('SET_PREFERRED_NAME', this.userName); 
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
  filterResults(){
    //grab the current query
    
  },

  watch: {
    // Watch for changes in the Vuex state's searchResults
    searchResults(newResults) {
      // Assuming filterResults method is implemented to process the results
      this.filterResults(newResults);
    },

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
  grid-template-columns: 275px 1fr 200px; /* Three unequal columns */
}
.grid-container {
  display: grid;
  grid-template-columns: 200px 1fr 200px; /* Three unequal columns */
  grid-template-rows: auto; /* Rows adjust to content height */
  gap: 20px; /* Space between grid items */
  align-items: start; /* Align items to the top of their cell */
  grid-template-areas: 
    "logo welcome right-top-placeholder"
    "nav qa-section motivational-quote"
    "bottom-left-placeholder skyline bottom-right-placeholder";
}

/* Assign grid area names to the children */
.logo { grid-area: logo; }
.welcome { grid-area: welcome; }
.right-top-placeholder { grid-area: right-top-placeholder; }
.home-nav { 
  grid-area: nav; 
}
.qa-section { grid-area: qa-section; }
.motivational-quote { grid-area: motivational-quote; }
.bottom-left-placeholder { grid-area: bottom-left-placeholder; }
.skyline { grid-area: skyline; }
.bottom-right-placeholder { grid-area: bottom-right-placeholder; }

/* Styling for the logo to make it smaller and align properly */
/* Styling for the logo container */
/* Styling for the logo container */
.grid-item.logo {
  /* Center the logo within its grid cell */
  display: flex;
  justify-content:center;
  align-items:center;
  margin-top: 0px;
  filter: drop-shadow(-1px -1px 1px #b5b6b8); /* Shadow effect for depth */  
  
}

/* Styling for the logo image */
.grid-item.logo img {
  width: 250px; /* You may set a max-width instead if the image is too large */
  height: auto; /* Maintain aspect ratio */
  margin-left: 75px;
  /* Remove max-height if it's not needed or adjust accordingly */
}


/* Welcome message styling */
/* Styling for the welcome message container */
/* Styling for the welcome container */
.welcome {
  display: flex; /* Use Flexbox for alignment */
  flex-direction: column; /* Stack elements vertically */
  justify-content: flex-start; /* content vertically */
  align-items: center; /* Center content horizontally */
  text-align: center; /* Ensure text is centered */
  grid-column: 1 / -1; /* Span across all columns */
  margin-top: 0; /* Remove top margin to bring closer to the top */
  padding-top: 1em; /* Add padding to space it from the top edge */
  color: var(--color-pink);
  text-shadow: 2px 2px 4px rgba(66, 65, 65, 0.4);
}
/* Styling for h1 inside the welcome container */
/* Styling for h1 inside the welcome container */
/* Styling for h1 inside the welcome container */
.welcome h1 {
  font-size: 45px; /* Size relative to the viewport width */
  margin-top: 0; /* Remove top margin to bring closer to the top */
  margin-bottom: 0; /* Spacing between h1 and h2 */
  font-family: prompt;
}

/* Styling for the prompt beneath the welcome message */
.welcome h2 {
  font-size: 45px; /* Slightly smaller than the h1 */
  margin-top: 0; /* Remove top margin to reduce space */
  margin-bottom: 0.5em; /* Consistent spacing */
  font-family: prompt;
}

/* Align navigation links to the left */
.home-nav {
  display: flex;
  justify-content: space-between;
  padding: 10px;
  margin-top: 20px;
  margin-left: 20px;
  text-align: center;
  font-size: 25px;
  font-family: prompt;
  text-shadow: 2px 2px 4px rgba(66, 65, 65, 0.2);
  background-color: hsla(0, 0%, 0%, 0.5);
  border-radius: 0.5rem;
}

.home-nav a{
  color: #ffffff;
  text-decoration: none;
  font-family: prompt;
  transition: color 0.2s ease-in-out;
}
.home-nav a:hover{
  color: #1dd3da;
  
  justify-content: flex-start; /* Aligns content to the left */
  padding: 10px;
  margin-top: 20px;
  text-align: center;
  font-size: 25px;
  text-shadow: 2px 2px 4px rgba(66, 65, 65, 0.2);
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
  width: 800px; /* Adjust width considering the padding */
  height: 50px; /* Standard input height */
  padding: 0 15px; /* Padding inside the input */
  font-size: 1rem; /* Standard font size */  
  font-family: prompt;
  border-radius: 8px; /* Rounded corners */
  border: none;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.2); /* Shadow for depth */
  margin-top: 10px; /* Space above the input box */
  
}

/* Styling for the placeholder text in input */
.input-box input[type="text"]::placeholder,
.initial-input::placeholder {
  color: #999; /* Change the color to a desired color */
  font-family: prompt;
  font-style: italic; /* Apply italic font style */
  /* You can also adjust other properties like font-size, font-weight, etc. */
}

/* QA Section specific styles */
.qa-section {
  display: flex;
  flex-direction: column;
  align-items: center; /* Center the children horizontally */
  width: 80%; /* Set a max width for the Q&A section */
  max-width: 100%; /* Ensure this does not exceed the viewport width */
  margin: auto; /* Center the section in the grid area */
  margin-bottom: 0px;
}

/* QA Container specific styles */
.qa-container {
  background-color: rgba(255, 255, 255, 0.5); /* Semi-transparent white */  
  border-radius: 15px; /* Rounded corners */
  padding: 20px; /* Padding inside the container */
  margin-bottom: 10px; /* Space between the QA container and the input box */
  width: 800px; /* Full width of the qa-section */
  height: 450px; /* Fixed height with scrolling */
  overflow-y: auto; /* Scrollbar for overflow content */
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); /* Shadow for depth */
}
.question{
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
  width: 800px; /* Adjust width considering the padding */
  height: 50px; /* Standard input height */
  padding: 0 15px; /* Padding inside the input */
  font-size: 1rem; /* Standard font size */  
  border-radius: 8px; /* Rounded corners */
  border: none;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.2); /* Shadow for depth */
  margin-top: 10px; /* Space above the input box */
  margin-bottom: 0px;
}

/* Styling for the skyline image, serving as the footer visually */
.skyline img {
  width: 100%; /* Full width of the grid area */
  height: auto; /* Height to maintain aspect ratio */
  object-fit: cover; /* Cover the grid area without stretching */
  filter: drop-shadow(-10px -10px 10px #b5b6b8); /* Shadow effect for depth */  
}

</style>