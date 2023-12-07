<template>
  <!--added login-container to grab this and manipulate it with css-->
  <div id="login" class="login-container text-center">
    <!-- also added -container to this so that we make the form a box to manipulate with css-->
    <h1 class="grid-item welcome-section">Please Sign In</h1>
    <div class="grid-item form-container">
      <form v-on:submit.prevent="login">

        <div role="alert" v-if="invalidCredentials">
          Invalid username and password!
        </div>
        <div role="alert" v-if="this.$route.query.registration">
          Thank you for registering, please sign in.
        </div>
          <div class="form-input-group">
            <label for="username">Username</label>
            <input type="text" id="username" v-model="user.username" required autofocus />
          </div>
          <div class="form-input-group">
            <label for="password">Password</label>
            <input type="password" id="password" v-model="user.password" required />
          </div>
          <button type="submit">Sign in</button>
          <p>
            <router-link class="register-link" v-bind:to="{ name: 'register' }">Need an account? Sign up.</router-link>
          </p>
        </form>
      </div>
      <div class="grid-item skyline-section">
      <img src="img/Chicago-90s.png" alt="City Skyline">
    </div>
  </div>
    <!--add footer for the chicago skyline-->

</template>

<script>
import authService from "../services/AuthService";

export default {
  //this changes the pages tab name
  mounted() {
    document.title = "Login";
  },

  components: {},
  data() {
    return {
      user: {
        username: "",
        password: ""
      },
      invalidCredentials: false
    };
  },
  methods: {
    login() {
      authService
        .login(this.user)
        .then(response => {
          if (response.status == 200) {
            this.$store.commit("SET_AUTH_TOKEN", response.data.token);
            this.$store.commit("SET_USER", response.data.user);
            this.$router.push("/");
          }
        })
        .catch(error => {
          const response = error.response;

          if (response.status === 401) {
            this.invalidCredentials = true;
          }
        });
    }
  }
};
</script>

<style scoped>
/* Grid container styles */
#login {
  display: grid;
  grid-template-columns: 1fr; /* Single column layout */
  grid-template-rows: auto auto auto; /* Three rows for Welcome, Form, and Skyline */
  grid-template-areas:
    "welcome-section"
    "form-section"
    "skyline-section";
  height: 100vh; /* Full height of the viewport */
  justify-content: center; /* Center grid items horizontally */
  align-items: center; /* Center grid items vertically */
}
#login .welcome-section {
  grid-area: welcome-section;
  /* Additional styling for the welcome section */
}

#login .form-container {
  grid-area: form-container;
  /* Additional styling for the form container */
}

#login .skyline-section {
  grid-area: skyline-section;
  /* Additional styling for the skyline section */
}
h1.welcome-section {
  font-size: 100px;
  margin-top: 5px;
  margin-bottom: 20px;
  padding: 20px;
}

/* Common styles for all grid items */
#login .grid-item {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  width: 100%; /* Ensure grid items take up full width */
}

/* Styling for the Welcome section */
#login .welcome-section {
  grid-area: welcome-section;
  text-align: center; /* Center text */
  color: var(--color-pink);
  text-shadow: 2px 2px 4px rgba(66, 65, 65, 0.4);
}



/* Styling for the Form container */
#login .form-container {
  grid-area: form-section;
  background-color: var(--color-white);
  padding: 20px;
  margin-left: auto;
  margin-right: auto;
  border-radius: 8px;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
  width: 100%;
  max-width: 500px;
  max-height: 350px;
  display: flex;
  flex-direction: column;
  align-items: center;
  margin-top: 0px;
}

#login .form-container .form-input-group {
  display: flex;
  flex-direction: column; 
  margin-bottom: 1rem;
  text-align: left;
}

#login .form-container .form-input-group label {
  margin-bottom: 0.25rem;
  font-size: 20px;
  color: var(--color-light-purple);
  font-weight: bold;  
}

.form-input-group input[type="text"],
.form-input-group input[type="password"] {
  padding: 10px;
  width: 100%; /* Explicitly set the width */
  margin: 0; /* Remove any default margins */
  border: 1px solid #ccc;
  border-radius: 4px;
  font-size: 20px;
  color: var(--color-light-purple);
  box-sizing: border-box; /* Padding and border are included in the width */
}

/* Styling for the Sign in button */
#login .form-container button {
  padding: 10px;
  background-color: var(--color-dark-blue);
  color: #fff;
  font-weight: bold;
  font-size: 25px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  width: 100%;
}

#login .form-container button:hover {
  background-color: var(--color-light-blue);
}

/* Styling for the Register link */
#login .form-container .register-link {
  font-size: 25px;
  color: var(--color-light-purple);
}

/* Styling for the Skyline section */
#login .skyline-section {
  grid-area: skyline-section;
  display: flex; /* Use flexbox to center content */
  justify-content: center; /* Center horizontally */
  align-items: center; /* Center vertically */
  width: 100%; /* Full width of the grid area */
  height: 100%; /* Full height of the grid area */
  overflow: hidden; /* In case image is larger than the section */
}

#login .skyline-section img {
  max-width: 100%; /* Allow image to scale down */
  max-height: 100%; /* Keep image within the section */
  object-fit: contain; /* Ensures the entire image is visible */
  filter: drop-shadow(-10px -10px 10px #c3c3f0);
}
</style>