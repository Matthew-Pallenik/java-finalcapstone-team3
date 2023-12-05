<template>
  <div class="home">
    <h1>Welcome to Chatbot{{ userName ? ', ' + userName : '' }}!</h1>

    <!-- Display the prompt only if userName exists -->
    <h2 v-if="userName">What would you like help with?</h2>

    <!-- Container for displaying Q&A, shown only when userName is set -->
    <div v-if="userName" class="qa-container">
      <!-- Iterate over the Q&A history and display each pair -->
      <div v-for="(item, index) in qaHistory" :key="index" class="qa-message">
        <p class="question"><strong>Q:</strong> {{ item.question }}</p>
        <p class="answer"><strong>A:</strong> {{ item.answer }}</p>
      </div>
    </div>

    <!-- Input for asking questions, shown only when userName is set -->
    <div v-if="userName" class="input-box">
      <input type="text" v-model="userQuery" @keyup.enter="processQuery" placeholder="Ask me anything...">
    </div>

    <!-- Input for setting userName, shown only if userName is not set -->
    <div v-if="!userName">
      <input type="text" v-model="potentialUserName" @keyup.enter="saveName" placeholder="Enter your name here">
    </div>
  </div>

  <!-- Footer with skyline image -->
  <div class="footer">
    <img src="img/Cleveland-grey.png" alt="City Skyline">
  </div>
</template>
<script>

export default {
  data() {
    return {
      potentialUserName: '',
      userName: '',
      userQuery: '',
      qaHistory: [] // Array to hold the history of Q&A
    };
  },
  methods: {
    saveName() {
      this.userName = this.potentialUserName;
      // Add additional logic if needed
    },
    processQuery() {
      // Here you would process the query and generate an answer
      // This is a placeholder for the logic
      const answer = 'This is a placeholder answer.';

      // Add the Q&A pair to the history
      this.qaHistory.push({ question: this.userQuery, answer: answer });

      // Clear the input field
      this.userQuery = '';
    }
  }
};
</script>
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
  width: 1000px;
  /* Maximum width of the container */
  height: 450px;
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
  margin-top: 150px;
  padding: 20px;
}

h2 {
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
</style>