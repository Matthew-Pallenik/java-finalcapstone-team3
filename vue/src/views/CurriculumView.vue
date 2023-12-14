<template>
    <div class="curriculum grid-container">
        <!-- Top Row -->
        <div class="grid-item top-left logo">
            <img src="img/Gary-LOGO.png" alt="TE Logo">
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
                <li><router-link v-bind:to="{ name: 'AboutUs' }" class="nav-link">About Us</router-link></li>
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
        <div class="grid-item middle-right">
            
           
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
    <!-- Motivational quotes content goes here -->
    <h2 class="need-motivation">Need Motivation?</h2>
    <h2 class="motivational-quote">{{ this.quote }}</h2>
    <h3 class="quote-author"> - {{ quoteAuthor }}</h3>
</div>
    

</template>
<script>
import { mapState, mapActions } from 'vuex';
import router from '@/router';
import QuoteService from '../services/QuoteService';

export default {
    mounted() {
        document.title = "Curriculum";
        this.fetchRandomCurriculum();
        this.fetchRandomQuote();
    },
    data(){
        return{
            quote:'',
            quoteAuthor:''
        }
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
    }
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


.motivational-quotes {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  background-color: hsla(0, 2%, 46%, 0.5);
  border-radius: 0.5rem;
  padding: 20px;
  margin-top: 25px;
  font-size: 20px;
  color: #ffffff;
  text-shadow: 2px 2px 4px rgba(66, 65, 65, 0.4);
  font-family: prompt;
}

.welcome {
    grid-area: welcome;
    display: flex;
    justify-content: center;
    align-items: center;
    font-family: prompt;
    font-size: 45px;
    color: whitesmoke;
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

.curriculum-grid {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  grid-gap: 20px;
  padding: 20px;
}

.curriculum-cell {
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

.curriculum-cell:hover {
  transform: translateY(-5px);
  box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2);
}

.curriculum-title {
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
.footer {
  grid-area: footer;
  background-color: #131c5a; /* Blue color for the footer */
  height: 30vh; /* Set the desired height for the footer */
  display: grid;
  text-align: center;
  justify-content: center;
  align-items: center;
  color: white; /* Text color for the footer content */
  font-family: prompt;
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

</style>

