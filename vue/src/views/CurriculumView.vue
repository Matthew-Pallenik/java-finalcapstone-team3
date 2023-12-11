<template>
    <div class="curriculum grid-container">
        <!-- Top Row -->
        <div class="grid-item top-left logo">
            <img src="img/TE-LOGO-green-blue.png" alt="TE Logo">
        </div>
        <div class="grid-item top-center welcome">
            <h2>Curriculum</h2>
            <!-- Welcome content goes here -->
        </div>
        <div class="grid-item top-right">
            <!-- This cell is intentionally left empty -->
        </div>

        <!-- Middle Row -->
        <div class="grid-item middle-left nav">
            <!-- Navigation content goes here -->
            <ul>
                <li><router-link v-bind:to="{ name: 'home' }" class="nav-link">Home</router-link></li>
                <li><router-link v-bind:to="{ name: 'Pathway' }" class="nav-link">Pathway</router-link></li>                
                <li><router-link v-bind:to="{ name: 'Jobs' }" class="nav-link">Jobs</router-link></li>
                <li><router-link v-bind:to="{ name: 'AskForHelp' }" class="nav-link">Ask For Help</router-link></li>
                <li><router-link v-bind:to="{ name: 'logout' }" v-if="$store.state.token != ''"
                        class="nav-link">Logout</router-link></li>
            </ul>
        </div>
        <div class="grid-item middle-center curriculum-content">
            <!-- Create a grid container for the curriculum titles -->
            <div class="curriculum-grid">
                <!-- Loop over the first 9 curriculum and display each title in its own cell -->
                <div v-for="curriculum in curriculums.slice(0, 9)" :key="curriculum.id" class="curriculum-cell"
                    @click="goToLink(curriculum.link)">
                    <p class="curriculum-title">{{ curriculum.title }}</p>
                </div>
            </div>
            <!-- Input Container -->
            <div class="input-container">
                <input type="text" placeholder="Ask me anything..." class="curriculum-input"
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
            <img src="img/Columbus-90s.png" alt="City Skyline">
        </div> -->
        <div class="grid-item bottom-right">
            <!-- this is intentionally right empty-->
        </div>

    </div>
    
  <div class="grid-item footer">

</div>
    

</template>
<script>
import { mapState, mapActions } from 'vuex';
import router from '@/router';

export default {
    mounted() {
        document.title = "Curriculum";
        this.fetchRandomCurriculum();
    },
    computed: {
        ...mapState(['curriculums']),
    },
    methods: {
        ...mapActions(['fetchRandomCurriculum']),
        goToLink(url) {
            window.open(url, '_blank');
        },
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
    grid-template-columns: 1fr, 3fr, 1fr;
    /* Three columns of equal size */
    grid-template-rows: auto auto 1frSSS;
    /* Three rows, size determined by content */
    gap: 10px;
    /* Space between grid items */
    justify-items: center;
    /* Center items horizontally */
    align-items: center;
    /* Center items vertically */

    background-image: url('img/Columbus-90s.png'); /* Set the skyline image as the background */
  background-size: 145%; /* Cover the entire container with the background image */
  background-position: center calc(100% + 550px ); /* Center the background image and position it below the bottom of the grid */
  background-repeat: no-repeat; /* Do not repeat the background image */
}

/* Assign the grid-template-areas to match the layout */
.grid-container {
    grid-template-areas:
        "logo welcome empty1"
        "nav curriculum-content motivational-quotes"
        "footer footer footer";
}

/* Place each grid-item in the correct grid area */
.logo {
    grid-area: logo;
    display: flex;
    justify-content: center;
    align-items: center;
    margin-top: 0px;
    filter: drop-shadow(-1px -1px 1px #b5b6b8);
    /* Shadow effect for depth */
}

#TE Logo {
    width: 250px;
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

/* empty1 does not need a style since it is intentionally left empty */

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

.curriculum-grid {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    /* Create three columns */
    grid-gap: 20px;
    /* Adjust to your preference for space between grid items */
    padding: 20px;
    /* Padding around the entire grid */
}

.curriculum-cell {
    background-color: #fff;
    /* White background for the cell */
    border-radius: 10px;
    /* Rounded corners for the cells */
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.2);
    /* Shadow for depth */
    padding: 20px;
    /* Padding inside each cell */
    display: flex;
    justify-content: center;
    /* Center the content horizontally */
    align-items: center;
    /* Center the content vertically */
    cursor: pointer;
    /* Change cursor to indicate the cell is clickable */
    transition: transform 0.3s ease, box-shadow 0.3s ease;
    /* Smooth transition for hover effects */
}


.curriculum-cell:hover {
    transform: translateY(-5px);
    /* Slightly raise the cell on hover */
    box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2);
    /* Larger shadow for lifted effect */
}

.curriculum-title {
    margin: 0;
    /* Remove default margin from paragraph tags */
    font-size: 20px;
    /* Adjust font size as needed */
    font-family: prompt;
    color: var(--color-light-blue);
    text-align: center;
    /* Center text */
}

/* Style for the input container */
.input-container {
    display: flex;
    justify-content: center;
    /* Center the input horizontally */
    height: 50px;
    padding: 20px;
}

/* Style for the input box */
.curriculum-input {
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

/* empty2 and empty3 do not need styles since they are intentionally left empty */

body{
    overflow: hidden;
}

.footer {
  grid-area: footer;
  background-color: #131c5a; /* Blue color for the footer */
  height: 300px; /* Set the desired height for the footer */
  display: flex;
  justify-content: center;
  align-items: center;
  color: white; /* Text color for the footer content */
  font-family: prompt;
}

</style>

