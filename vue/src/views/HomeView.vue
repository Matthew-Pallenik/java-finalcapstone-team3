<template>
  <div class="home">
    <!-- Header section welcoming the user -->
    <h1>Welcome to Chatbot{{ userName ? ', ' + userName : '' }}!</h1>

    <!-- Section for setting the user's name, visible only if userName is not set -->
    <div v-if="!userName">
      <h2>What would you like me to call you?</h2>
      <input type="text" v-model="potentialUserName" @keyup.enter="saveName" placeholder="Enter your name here">
    </div>

    <!-- Prompt for help and user input box, visible only when userName is set -->
    <div v-if="userName">
      <h2>What would you like help with?</h2>
      <!-- Input box for user to ask questions -->
      <div class="input-box">
        <input type="text" v-model="userQuery" @keyup.enter="processQuery" placeholder="Ask me anything...">
      </div>
    </div>

    <!-- Display search results, visible only when there are results -->
    <div v-if="searchResults && searchResults.length > 0" class="search-results">
      <h2>Search Results</h2>
      <!-- Loop through each search result and display its content -->
      <div v-for="(result, index) in searchResults" :key="index" class="result-item">
        <h3>{{ result.title }}</h3>
        <p>{{ result.description }}</p>
        <a :href="result.link" target="_blank">Learn More</a>
      </div>
    </div>

    <!-- Container for displaying Q&A history, visible only when userName is set -->
    <div v-if="userName" class="qa-container">
      <div v-for="(item, index) in qaHistory" :key="index" class="qa-message">
        <p class="question"><strong>Q:</strong> {{ item.question }}</p>
        <p class="answer"><strong>A:</strong> {{ item.answer }}</p>
      </div>
    </div>

    <!-- Footer with skyline image -->
    <div class="footer">
      <img src="img/Cleveland-grey.png" alt="City Skyline">
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
      potentialUserName: '',
      userName: '',
      userQuery: '',
      qaHistory: [] // Array to hold the history of Q&A
    };
  },

  methods: {
    ...mapActions(['performSearch']), // Map the performSearch action from Vuex

    saveName() {
      this.userName = this.potentialUserName.trim();
      this.potentialUserName = ''; // Reset the potential user name
    },

    async processQuery() {
      if (!this.userQuery) return;

      const placeholderAnswer = 'Processing your request...';
      this.qaHistory.push({ question: this.userQuery, answer: placeholderAnswer });

      // Dispatch the Vuex action to perform the search
      await this.performSearch(this.userQuery);

      // Retrieve the updated search results from Vuex state
      const results = this.searchResults.map(result =>
        `${result.title}: ${result.description}. More info: ${result.link}`
      ).join('\n');

      // Update the answer in qaHistory with actual search results
      const updatedAnswer = results ? `Here are your search results:\n${results}` : 'No results found.';
      this.qaHistory[this.qaHistory.length - 1].answer = updatedAnswer;

      this.userQuery = ''; // Reset the user query input
    }
  },

  watch: {
    // Watch for changes in the Vuex state's searchResults and update local data
    searchResults(newResults) {
      this.qaHistory[this.qaHistory.length - 1].searchResults = newResults;
    }
  }
};
</script>

<style>
  /* Add your CSS styles here */
</style>
<!--added scoped here so this css doesn't affect other css views-->
<style scoped>
.qa-container {
  background-color: rgba(255, 255, 255, 0.5);
  /* Semi-transparent white */
  border: 1px solid var(--color-darker-purple);
  /* Border color */
  border-radius: 15px;
  /* Rounded corners for the chat bubble look */
  padding: 20px;
  margin: 20px auto;
  /* Center the container */
  width: 800px;
  /* Maximum width of the container */
  height: 350px;
  /* Maximum height before scrolling */
  overflow-y: auto;
  /* Enable vertical scrolling */
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
  /* Subtle shadow for depth */
}

/* Styles for questions */
.qa-container .question {
  color: var(--color-darker-purple);
  font-weight: bold;
  font-size: 25px;
  /* Color for questions */
  margin-bottom: 5px;
  /* Space between question and answer */
}

/* Styles for answers */
.qa-container .answer {
  color: var(--color-light-blue);
  font-weight: bold;
  font-size: 25px;
  /* Color for answers */
  margin-bottom: 10px;
  /* Space between answer and next question */
}

input[type="text"] {
  width: 45%;
  /* Adjust width as per requirement */
  height: 50px;
  /* Adjust height as needed */
  margin: 0 auto;
  /* Center the input horizontally */
  display: block;
  padding: 10px 15px;
  /* Adjust padding for better text spacing */
  font-size: 1.5rem;
  /* Adjust font size for larger text */
  border: 2px solid var(--color-darker-purple);
  /* Border for definition */
  border-radius: 8px;
  /* Rounded corners */
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.2);
  /* Subtle shadow for depth */
  margin-top: 55px;
}


input[type="text"]:focus {
  outline: none;
  border-color: var(--color-light-blue);
}

h1,
h2 {
  color: var(--color-darker-purple);
  text-align: center;
  text-shadow: 2px 2px 4px rgba(66, 65, 65, 0.4);
}

h1 {
  font-size: 85px;
  margin-top: 15px;
  padding: 20px;
  margin-bottom: 0px;
}

h2 {
  margin-top: 0px;
  font-size: 50px;
}

.footer {
  position: absolute;
  left: 0;
  bottom: 0;
  width: 100%;
  height: 150px;
  /* Adjust the height as needed */
  /* Other styles for your footer */
}

.footer img {
  width: 100%;
  height: 250px;
  object-fit: none;
  filter: drop-shadow(-10px -10px 10px #9c9ce0);
}
/* Tablet size @media query */
@media (min-width: 768px) and (max-width: 1023px) {
  .qa-container {
    width: 80%; /* Adjust the width to be more responsive */
    height: 400px; /* Slightly reduced height */
    padding: 15px; /* Adjust padding */
    margin: 15px auto; /* Adjust margin */
  }

  .qa-container .question,
  .qa-container .answer {
    font-size: 15px; /* Slightly reduced font size for better readability */
  }

  input[type="text"] {
    width: 70%; /* Adjust width for better fit */
    font-size: 1.2rem; /* Adjust font size */
  }

  h1 {
    font-size: 45px; /* Reduced font size */
    margin-top: 20px; /* Adjusted margin */
  }

  h2 {
    font-size: 40px; /* Reduced font size */
  }

  .footer {
    height: 120px; /* Adjusted footer height */
  }

  .footer img {
    height: 200px; /* Adjust image size in the footer */
  }

  /* Additional tablet-specific styles can be added here */
}
/* Phone size @media query */
@media (max-width: 430px) {
  .qa-container {
    width: 80%; /* Full width for smaller screens */
    height: auto; /* Dynamic height based on content */
    padding: 10px; /* Adjusted padding */
    margin: 10px auto; /* Adjusted margin */
    overflow-y: auto; /* Ensuring vertical scrolling if needed */
    max-height: 325px;
  }

  .qa-container .question,
  .qa-container .answer {
    font-size: 18px; /* Smaller font size for better readability */
  }

  input[type="text"] {
    width: 85%; /* Adjust width for better fit */
    height: 40px; /* Adjust height */
    font-size: 1rem; /* Smaller font size */
    margin-top: 20px; /* Adjusted top margin */
  }

  h1 {
    font-size: 25px; /* Reduced font size for smaller screens */
    margin-top: 0px; /* Adjusted top margin */
  }

  h2 {
    font-size: 20px; /* Reduced font size */
  }

  .footer {
    height: auto; /* Adjusted footer height */
  }

  .footer img {
    height: 250px; /* Adjusted image size in the footer */
  }

  /* Additional phone-specific styles can be added here */
}
/* Phone size @media query */
@media (max-width: 390px) {
  .qa-container {
    width: 80%; /* Full width for smaller screens */
    height: auto; /* Dynamic height based on content */
    padding: 10px; /* Adjusted padding */
    margin: 10px auto; /* Adjusted margin */
    overflow-y: auto; /* Ensuring vertical scrolling if needed */
    max-height: 325px;
  }

  .qa-container .question,
  .qa-container .answer {
    font-size: 18px; /* Smaller font size for better readability */
  }

  input[type="text"] {
    width: 85%; /* Adjust width for better fit */
    height: 40px; /* Adjust height */
    font-size: 1rem; /* Smaller font size */
    margin-top: 20px; /* Adjusted top margin */
  }

  h1 {
    font-size: 25px; /* Reduced font size for smaller screens */
    margin-top: 0px; /* Adjusted top margin */
  }

  h2 {
    font-size: 20px; /* Reduced font size */
  }

  .footer {
    height: auto; /* Adjusted footer height */
  }

  .footer img {
    height: 250px; /* Adjusted image size in the footer */
  }

  /* Additional phone-specific styles can be added here */
}
/* Phone size @media query */
@media (max-width: 360px) {
  .qa-container {
    width: 80%; /* Full width for smaller screens */
    height: auto; /* Dynamic height based on content */
    padding: 10px; /* Adjusted padding */
    margin: 10px auto; /* Adjusted margin */
    overflow-y: auto; /* Ensuring vertical scrolling if needed */
    max-height: 200px;
  }

  .qa-container .question,
  .qa-container .answer {
    font-size: 18px; /* Smaller font size for better readability */
  }

  input[type="text"] {
    width: 85%; /* Adjust width for better fit */
    height: 40px; /* Adjust height */
    font-size: 1rem; /* Smaller font size */
    margin-top: 20px; /* Adjusted top margin */
  }

  h1 {
    font-size: 25px; /* Reduced font size for smaller screens */
    margin-top: 0px; /* Adjusted top margin */
  }

  h2 {
    font-size: 20px; /* Reduced font size */
  }

  .footer {
    height: auto; /* Adjusted footer height */
  }

  .footer img {
    height: 250px; /* Adjusted image size in the footer */    
  }

  /* Additional phone-specific styles can be added here */
}
</style>