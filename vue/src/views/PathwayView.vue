<template>
    <div class="pathway grid-container">
        <!-- Top Row -->
        <div class="grid-item top-left logo">
            <img src="img/TE-LOGO-green-blue.png" alt="TE Logo">
        </div>
        <div class="grid-item top-center welcome">
            <h2>Pathway</h2>
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
                <li><router-link v-bind:to="{ name: 'Curriculum' }" class="nav-link">Curriculum</router-link></li>
                <li><router-link v-bind:to="{ name: 'Jobs' }" class="nav-link">Jobs</router-link></li>
                <li><router-link v-bind:to="{ name: 'AskForHelp' }" class="nav-link">Ask For Help</router-link></li>
                <li><router-link v-bind:to="{ name: 'AboutUs' }" class="nav-link">About Us</router-link></li>
                <li><router-link v-bind:to="{ name: 'logout' }" v-if="$store.state.token != ''"
                        class="nav-link">Logout</router-link></li>
            </ul>
        </div>
        <div class="grid-item middle-center pathway-content">
            <!-- Create a grid container for the pathway titles -->
            <div class="pathways-grid">
                <!-- Loop over the first 9 pathways and display each title in its own cell -->
                <div v-for="pathway in pathways.slice(0, 9)" :key="pathway.id" class="pathway-cell"
                    @click="goToLink(pathway.link)">
                    <p class="pathway-title">{{ pathway.title }}</p>
                </div>
            </div>
            <!-- Input Container -->
            <div class="input-container">
                <input type="text" placeholder="Ask me anything..." class="pathway-input"
                    @keyup.enter="handleInputEnter($event.target.value)">
            </div>
        </div>
        <div class="grid-item middle-right">
           
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
    <div class="grid-item footer">
       <!-- Motivational quotes content goes here -->
            
      <h2 class="need-motivation?">Need Motivation?</h2>
    <h3 class="motivational-quote">{{ this.quote }}</h3>
    <h3 class="quote-author"> - {{ quoteAuthor }}</h3>

    </div>
</template>

<script>
import { mapState, mapActions } from 'vuex';
import router from '@/router';
import QuoteService from '../services/QuoteService';

export default {
    mounted() {
    document.title = "Pathway";
    this.fetchRandomPathways();
    this.fetchRandomQuote();
  },  
  computed: {
    ...mapState(['pathways']),
  },
  data(){
    return {
      quote:'',
      quoteAuthor:''
    }
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
    background-image: url('img/Pittsburgh-90s.png');
    background-size: 150%;
    background-position: center calc(100% + 600px) ;
    background-repeat: no-repeat;
}

/* Assign the grid-template-areas to match the layout */
.grid-container {
    grid-template-areas:
        "logo welcome empty1"
        "nav pathway-content motivational-quotes"
        "footer footer footer";

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

.welcome {
    grid-area: welcome;
    display: flex;
    justify-content: center;
    align-items: center;
    font-family: prompt;
    font-size: 45px;
    color: white;
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
  background-color: hsla(0, 2%, 46%, 0.5);
border-radius: 0.5rem;
}
.nav a {
  color: #ffffff;
  text-decoration: none;
  font-family: prompt;
  transition: color 0.2s ease-in-out;
}
.nav a:hover {
  color: #1dd3da;

}

li {
    display: list-item;
    list-style-type: none;
    padding: 5px;
}

.pathways-grid {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  grid-gap: 20px;
  padding: 20px;
}

.pathway-cell {
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

.pathway-cell:hover {
  transform: translateY(-5px);
  box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2);
}

.pathway-title {
  margin: 0;
  font-size: 20px;
  font-family: prompt;
  color: var(--color-light-blue);
  text-align: center;
}

.input-container {
  display: flex;
  justify-content: center;
  height: 50px;
  padding: 20px;
}

.pathway-input {
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
.motivational-quotes {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  background-color: hsla(0, 2%, 46%, 0.5);
  border-radius: 0.5rem;
  padding: 20px;
  margin-top: 20px;
  font-size: 20px;
  color: #ffffff;
  text-shadow: 2px 2px 4px rgba(66, 65, 65, 0.4);
  font-family: prompt;
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

/* empty2 and empty3 do not need styles since they are intentionally left empty */

</style>