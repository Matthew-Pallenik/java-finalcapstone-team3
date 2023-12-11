<template>
    <div class="aboutUs grid-container">
        <!-- Top Row -->
        <div class="grid-item top-left logo">
            <img src="img/TE-LOGO-green-blue.png" alt="TE Logo">
        </div>
        <div class="grid-item top-center welcome">
            <h2>About Us</h2>
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
                <li><router-link v-bind:to="{ name: 'Curriculum' }" class="nav-link">Curriculum</router-link></li>
                <li><router-link v-bind:to="{ name: 'Jobs' }" class="nav-link">Jobs</router-link></li>
                <li><router-link v-bind:to="{ name: 'AskForHelp' }" class="nav-link">Ask For Help</router-link></li>
                <li><router-link v-bind:to="{ name: 'logout' }" v-if="$store.state.token != ''" class="nav-link">Logout</router-link></li>
            </ul>
        </div>
        <div class="grid-item middle-center aboutUs-content">
            <!-- Create a grid container for the About Us entries -->
            <h3>This chatbot was brought to you by the following:</h3>
            <p></p>
            <ul>
                <li>Jake Butler</li>
                <li>Ahmed Elbagory</li>
                <li>Matthew Pallenik</li>
                <li>Bryson Poole</li>
                <li>Roxana Valdina</li>
                <li>And viewers like you! Thank you!</li>
            </ul>
            
        </div>
        <div class="grid-item middle-right motivational-quotes">
            <!-- Motivational quotes content goes here -->
        </div>

        <!-- Bottom Row -->
        <div class="grid-item bottom-left">
            <!-- This cell is intentionally left empty -->
        </div>
        <div class="grid-item bottom-center skyline">
            <img src="img/Pittsburgh-90s.png" alt="City Skyline">
        </div>
        <div class="grid-item bottom-right">
            <!-- this is intentionally right empty-->
        </div>
    </div>
</template>

<script>
import { mapState, mapActions } from 'vuex';
import router from '@/router';

export default {
    mounted() {
    document.title = "Pathway";
    this.fetchRandomPathways();
  },  
  computed: {
    ...mapState(['pathways']),
  },
  methods: {
    ...mapActions(['fetchRandomPathways']),
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
    grid-template-columns: repeat(3, 1fr);/* Three columns of equal size */    
    grid-template-rows: auto auto auto;/* Three rows, size determined by content */    
    gap: 10px;/* Space between grid items */    
    justify-items: center; /* Center items horizontally */
    align-items: center; /* Center items vertically */
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    /* Three columns of equal size */
    grid-template-rows: auto auto auto;
    /* Three rows, size determined by content */
    gap: 10px;
    /* Space between grid items */
}

/* Assign the grid-template-areas to match the layout */
.grid-container {
    grid-template-areas:
        "logo welcome empty1"
        "nav aboutUs-content motivational-quotes"
        "empty2 skyline empty3";
}

/* Place each grid-item in the correct grid area */
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

/* empty1 does not need a style since it is intentionally left empty */

.nav {
    grid-area: nav;
    display: flex;
    justify-content: flex-start;/* Aligns content to the left */    
    justify-content: flex-start;
    /* Aligns content to the left */
    padding: 10px;
    margin-top: 20px;
    text-align: center;
    font-size: 25px;
    font-family: prompt;
    text-shadow: 2px 2px 4px rgba(66, 65, 65, 0.2);
}

li {
    display: list-item;
    list-style-type: none;
    padding: 5px;
}



.motivational-quotes {
    grid-area: motivational-quotes;
}

/* empty2 and empty3 do not need styles since they are intentionally left empty */

.skyline {
    grid-area: skyline;
    filter: drop-shadow(-10px -10px 10px #b5b6b8); /* Shadow effect for depth */       
}
</style>