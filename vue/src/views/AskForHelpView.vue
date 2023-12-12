<template>
    <div class="askForHelp grid-container">
        <div class="grid-itme top-left logo">
            <img src="img/TE-LOGO-green-blue.png" alt="TE Logo">
        </div>
        <div class="grid-item top-center welcome">
            <h1>Ask For Help!</h1>
        </div>
        <div class="grid-item top-right">
            <!-- This cell is intentionally left empty -->
        </div>
        <!-- Middle Row -->
        <div class="grid-item middle-left nav">
            <!-- Navigation content goes here -->
            <ul>
                <li><router-link v-bind:to="{ name: 'home' }" class="nav-link">Home</router-link></li>
                <li><router-link v-bind:to="{ name: 'Curriculum' }" class="nav-link">Curriculum</router-link></li>
                <li><router-link v-bind:to="{ name: 'Jobs' }" class="nav-link">Jobs</router-link></li>
                <li><router-link v-bind:to="{ name: 'AskForHelp' }" class="nav-link">Ask For Help</router-link></li>
                <li><router-link v-bind:to="{ name: 'logout' }" v-if="$store.state.token != ''"
                        class="nav-link">Logout</router-link></li>
            </ul>
        </div>
        <div class="grid-item middle-center askForHelp-content">
            <!-- Create a grid container for the ask for help here -->
            <div class="askForHelp-grid">
                <p>What is Cliffton Strengths?</p>
                <p>What is Git?</p>
                <p>What are some front end job positions?</p>
                <p>What should I wear to a interview?</p>
                <p>What is a variable?</p>
                <p>What are some back end positions</p>
                <p>What is CRUD?</p>
                <p>I need help with my Resume.</p>
                <p>What is Database Design?</p>
                <p>What is Object Oriented Programming?</p>
                <p>What do I do after interviews?</p>
                <p>Job Positions?</p>
            </div>        
            <!-- Input Container -->
            <div class="input-container">
                <input type="text" placeholder="Ask me anything..." class="askForHelp-input"
                    @keyup.enter="handleInputEnter($event.target.value)">
            </div>
        </div>
        <div class="grid-item middle-right motivational-quotes">
            <!-- Motivational quotes content goes here -->
        </div>
        <!-- Bottom Row -->
        <div class="grid-item bottom-left">
            <!-- This cell is intentionally left empty -->
        </div>
        <!-- <div class="grid-item bottom-center skyline">
            <img src="img/Pittsburgh-90s.png" alt="City Skyline">
        </div> -->
        <div class="grid-item bottom-right">
            <!-- this is intentionally right empty-->
        </div>
    </div>
    <div class="grid-item footer"></div>
</template>

<script>
import router from '@/router';

export default {
    mounted() {
        document.title = "Ask For Help!";
    },
    methods: {
        handleInputEnter(query) {
            // Redirect to the home route with the query
            this.$router.push({ name: 'home', query: { search: query } });
        },
    },
}
</script>

<style scoped>
.grid-container {
    display: grid;    
    grid-template-columns: 1fr 3fr 1fr; /* Three columns: left, middle, right */
    grid-template-rows: auto auto auto;
    gap: 10px;
    justify-items: center;
    align-items: center;
    background-image: url('img/Chicago-90s.png');
    background-size: 150%;
    background-position: center calc(100% + 600px) ;
    background-repeat: no-repeat;
}

.grid-container {
    grid-template-areas:
        "logo welcome empty1"
        "nav askForHelp-content motivational-quotes"
        "footer footer footer";

}
.logo {
    grid-area: logo;
    display: flex;
    justify-content: center;
    align-items: center;
    margin-top: 0px;    
    filter: drop-shadow(-1px -1px 1px #b5b6b8);/* Shadow effect for depth */ 
}

#TE Logo {
    width: 250px;    
    height: auto;/* Maintain aspect ratio */ 
    margin-top: 0px;
    margin-left: 100px;
    filter: drop-shadow(-1px -1px 1px #b5b6b8);
    /* Shadow effect for depth */

}

#TE Logo {
    width: 250px;
    /* You may set a max-width instead if the image is too large */
    height: auto;
    /* Maintain aspect ratio */

}
.welcome {
    grid-area: welcome;
    display: flex;
    justify-content: center;
    align-items: center;
    font-family: prompt;
    font-size: 45px;
    color: var(--color-pink);
    text-shadow: 2px 2px 4px rgba(66, 65, 65, 0.4);
}
.nav {
    display: flex;
  justify-content: center;
  padding: 10px;
  margin-top: 20px;
  margin-left: 20px;
  margin-right: 20px;
  font-size: 25px;
  background-color: hsla(0, 0%, 0%, 0.5);
  border-radius: 0.5rem;
}
.nav a {
  color: #ffffff;
  text-decoration: none;
  font-family: prompt;
  transition: color 0.2s ease-in-out;
}
nav a:hover {
  color: #1dd3da;

}

li {
    display: list-item;
    list-style-type: none;
    padding: 5px;
}
.askForHelp-grid {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  grid-gap: 20px;
  padding: 20px;
}

p {
  background-color: #fff;
  border-radius: 10px;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.2);
  padding: 20px;
  display: flex;
  justify-content: center;
  align-items: center;
  cursor: pointer;
  transition: transform 0.3s ease, box-shadow 0.3s ease;
}


.input-container {
  display: flex;
  justify-content: center;
  height: 50px;
  padding: 20px;
}

.askForHelp-input {
  width: 100%;
  max-width: calc(100% - 40px);
  margin: 0 auto;
  padding: 10px 15px;
  border-radius: 10px;
  border: none;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.2);
  font-family: prompt;
  font-size: 18px;
  color: #5f5b5b;
}

.motivational-quotes {
    grid-area: motivational-quotes;
}

.footer {
  grid-area: footer;
  background-color: #131c5a; /* Blue color for the footer */
  height: 30vh; /* Set the desired height for the footer */
  display: flex;
  justify-content: center;
  align-items: center;
  color: white; /* Text color for the footer content */
  font-family: prompt;
}

</style>