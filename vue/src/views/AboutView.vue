<template>
    <div class="aboutUs grid-container">
        <!-- Top Row -->
        <div class="grid-item top-left logo">
            <img src="img/Gary-LOGO.png" alt="TE Logo">
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
            <h2>This chatbot was brought to you by the following:</h2>
            <p></p>
            <section id="all-items">
                <header></header>
                <section>
                    <article>
                        <div></div>
                        <div>
                            <h3>Jake Butler</h3>
                            <p>I'm Jake. I am a music lover, amateur athlete, and self-proclaimed comedian. 
                                I'm a career changer, pivoting from covering news to developing views. 
                                One thing that hasn't changed is my love for people and collaboration. 
                                While moving from journalism to development may seem like an odd shift, teamwork in both roles is vital, both for the team and my own personal human interaction quotas. 
                                My goal is to, yes, build a sustainable career in tech where I can contribute to amazing projects, but also to build genuine connections with colleagues and keep team morale at peak levels. 
                                This may be a good time to mention my bartending experience too.</p>
                        </div>
                    </article>
                    <article>
                        <div></div>
                        <div>
                            <h3>Ahmed Elbagory</h3>
                            <p>I am a computer technician who developed a passion for electronics at a young age, progressing from disassembling old devices to repairing them. 
                                As my expertise expanded, I transitioned from hardware troubleshooting to software exploration, seeking a holistic understanding of technology's problem-solving potential. 
                                Motivated by challenges, I aim to apply my unique blend of technical and creative skills in a junior software development role to contribute to business success and continue my personal growth.</p>
                        </div>
                    </article>
                    <article>
                        <div></div>
                        <div>
                            <h3>Matthew Pallenik</h3>
                            <p>I am a software developer with a background in shipping and logistics. 
                                I first got into computing because I was miffed that Madden and NCAA Football had declined for years, but got derailed from that after college.
                                But even though I was good enough to be an All-Star at my job, I still felt my skills weren't being put to the best use, so I decided to switch careers. 
                                That's when I remembered that my favorite parts of the job came when dealing with computers and programs. 
                                So to understand the other side of what happens with those programs, I am pursuing a career in coding.</p>
                        </div>
                    </article>
                    <article>
                        <div></div>
                        <div>
                            <h3>Bryson Poole</h3>
                            <p>I am a (mostly) ethical hacker and near unanimous winner of the "Grossest Website" award thanks to my skills in making seizure-inducing flashing backgrounds.</p>
                        </div>
                    </article>
                    <article>
                        <div></div>
                        <div>
                            <h3>Roxana Valdina</h3>
                            <p>I am a passionate lifelong learner, dedicated to growth and the deep exploration of challenges that push me beyond my comfort zone. 
                                My journey toward becoming a software engineer began with an interest in video game design and blossomed into a profound love for artificial intelligence and the endless opportunities to learn new technologies. 
                                There's always something to satiate my hunger for knowledge and fuel my curiosity. 
                                For me, building a career in technology isn't just a professional choice; it's about crafting a life dedicated to creating innovative solutions that genuinely impact people's lives. 
                                This path in software engineering is more than a career trajectory I've chosen; it's a testament to my belief that with passion and perseverance, anything is possible.</p>
                        </div>
                    </article>
                </section>
            </section>
            
        </div>
        <div class="grid-item middle-right motivational-quotes">
        </div>

        <!-- Bottom Row -->
        <div class="grid-item bottom-left">
            <!-- This cell is intentionally left empty -->
        </div>
        
        <div class="grid-item bottom-right">
            <!-- this is intentionally right empty-->
        </div>
        <div class="grid-item footer">
            <!-- Motivational quotes content goes here -->
            
        </div>
    </div>
</template>

<script>
import QuoteService from '../services/QuoteService';

export default {
    mounted() {
        document.title = "About Us";
        this.fetchRandomQuote();
    },
    data(){
    return {
        quote:'',
        quoteAuthor:''
    }
    },
    methods: {
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
    grid-template-columns: 1fr 3fr 1fr;/* Three columns of equal size */    
    grid-template-rows: auto auto auto;/* Three rows, size determined by content */    
    gap: 10px;/* Space between grid items */    
    justify-items: center; /* Center items horizontally */
    align-items: center; /* Center items vertically */
    background-image: url('img/Cleveland-90s.png');
    background-size: 145%;
    background-position: center calc(100% + 350px);
    background-repeat: no-repeat;  
}

/* Assign the grid-template-areas to match the layout */
.grid-container {
    grid-template-areas:
        "logo welcome empty1"
        "nav aboutUs-content motivational-quotes"
        "footer footer footer";
}

/* Place each grid-item in the correct grid area */
.logo {
    grid-area: logo;
    display: flex;
    justify-content: start;
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

ul {
    white-space: nowrap;
}

.aboutUs-content {
    grid-area: aboutUs-content;
    font-family: prompt;
    color: White;
}

.aboutUs-content h3 {
    font-size: 25px;
}

p{
    font-size: 18px;
}
#all-items section { 
    display: flex; 
    flex-direction: column;
}

 #all-items section article { 
    display: flex; 
    align-items: center;
}

#all-items section article div header {
    font-weight: bold;
}

.motivational-quotes {
    grid-area: motivational-quotes;
}

/* empty2 and empty3 do not need styles since they are intentionally left empty */

.footer {
  grid-area: footer;
  background-color: #131c5a;
  /* Blue color for the footer */
  height: 200px;
  /* Set the desired height for the footer */
  display: flex;
  justify-content: center;
  align-items: center;
  color: white;
  /* Text color for the footer content */
  font-family: prompt;
}

/* Styling for the skyline image, serving as the footer visually */
</style>