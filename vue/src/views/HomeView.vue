<template>
  <div class="home">
    <h1>Welcome to Chatbot{{ userName ? ', ' + userName : '' }}!</h1>
    
    <!-- User name input -->
    <div v-if="!userName">
      <h2>What would you like me to call you?</h2>
      <input type="text" v-model="potentialUserName" @keyup.enter="saveName" placeholder="Enter your name here">
    </div>
    
    <!-- User query input -->
    <div v-if="userName">
      <h2>What would you like help with?</h2>
      <input type="text" v-model="userQuery" @keyup.enter="processQuery" placeholder="Ask me anything...">
    </div>
    
    <!-- Container for displaying Q&A -->
    <div class="qa-container">
      <!-- Iterate over the Q&A history and display each pair -->
      <div v-for="(item, index) in qaHistory" :key="index">
        <p><strong>Q:</strong> {{ item.question }}</p>
        <p><strong>A:</strong> {{ item.answer }}</p>
      </div>
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
<style>
.qa-container {
  position: absolute;
  bottom: 200px; /* Adjust this value so the box sits just above the skyline */
  left: 0;
  right: 0;
  width: 80%; /* Or set a fixed width */
  margin-left: auto;
  margin-right: auto;
  /* Additional styles for padding, background, etc. */
}

input[type="text"] {
  width: 45%; /* Adjust width as per requirement */
  height: 50px; /* Adjust height as needed */
  margin: 0 auto; /* Center the input horizontally */
  display: block;
  padding: 10px 15px; /* Adjust padding for better text spacing */
  font-size: 1.5rem; /* Adjust font size for larger text */
  border: 2px solid var(--color-darker-purple); /* Border for definition */
  border-radius: 8px; /* Rounded corners */
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.2); /* Subtle shadow for depth */
  margin-top: 550px;
}


input[type="text"]:focus {
  outline: none;
  border-color: var(--color-light-blue);
}

h1, h2 {
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
    height: 150px; /* Adjust the height as needed */
    /* Other styles for your footer */
}

.footer img {
    width: 100%;
    height: 250px;
    object-fit:none;
    filter: drop-shadow(-10px -10px 10px  #9c9ce0);
}
</style>