<template>
  <!-- Grid container to arrange content -->
  <div id="register" class="grid-container">

    <!-- Welcome section -->
    <div class="grid-item welcome-section">
      <h1>Welcome to Chatbot</h1>
      <h2>Create Account</h2>
    </div>

    <!-- Form container -->
    <div class="grid-item form-container">
      <form v-on:submit.prevent="register">
        <!-- Error message display -->
        <div role="alert" v-if="registrationErrors">
          {{ registrationErrorMsg }}
        </div>

        <!-- Form input groups -->
        <div class="form-input-group">
          <label for="username">Username</label>
          <input type="text" id="username" v-model="user.username" required autofocus />
        </div>
        <div class="form-input-group">
          <label for="password">Password</label>
          <input type="password" id="password" v-model="user.password" required />
        </div>
        <div class="form-input-group">
          <label for="confirmPassword">Confirm Password</label>
          <input type="password" id="confirmPassword" v-model="user.confirmPassword" required />
        </div>

        <!-- Submit button -->
        <button type="submit">Create Account</button>
        
        <!-- Login link -->
        <p>
          <router-link class="login-link" v-bind:to="{ name: 'login' }">Already have an account? Log in.</router-link>
        </p>
      </form>
    </div>

    <!-- Skyline section -->
    <div class="grid-item skyline-section">
      <img src="img/Chicago-90s.png" alt="City Skyline">
    </div>

  </div> 
</template>

<script>
import authService from '../services/AuthService';

export default {
  //this changes the pages tab name
  mounted() {
    document.title = "Register";
  },

  data() {
    return {
      user: {
        username: '',
        password: '',
        confirmPassword: '',
        role: 'user',
      },
      registrationErrors: false,
      registrationErrorMsg: 'There were problems registering this user.',
    };
  },
  methods: {
    register() {
      if (this.user.password != this.user.confirmPassword) {
        this.registrationErrors = true;
        this.registrationErrorMsg = 'Password & Confirm Password do not match.';
      } else {
        authService
          .register(this.user)
          .then((response) => {
            if (response.status == 201) {
              this.$router.push({
                path: '/login',
                query: { registration: 'success' },
              });
            }
          })
          .catch((error) => {
            const response = error.response;
            this.registrationErrors = true;
            if (response.status === 400) {
              this.registrationErrorMsg = 'Bad Request: Validation Errors';
            }
          });
      }
    },
    clearErrors() {
      this.registrationErrors = false;
      this.registrationErrorMsg = 'There were problems registering this user.';
    },
  },
};
</script>

<style scoped>
/* Grid container styles */
#register {
  display: grid;
  grid-template-columns: 1fr; /* Single column layout */
  grid-template-rows: auto auto auto; /* Three rows for Welcome, Form, and Skyline */
  grid-template-areas:
    "welcome-section"
    "form-container"
    "skyline-section";
  height: 100vh; /* Full height of the viewport */
  justify-content: center; /* Center grid items horizontally */
  align-items: center; /* Center grid items vertically */
}

/* Assign grid area names to the children */
#register .welcome-section {
  grid-area: welcome-section;
  /* Additional styling for the welcome section */
}

#register .form-container {
  grid-area: form-container;
  /* Additional styling for the form container */
}

#register .skyline-section {
  grid-area: skyline-section;
  /* Additional styling for the skyline section */
}

/* Styling for the Welcome section */
#register .welcome-section h1,
#register .welcome-section h2 {
  display: flex;
  flex-direction: column;
  justify-content: center;
  color: var(--color-pink);  
  text-align: center;
  text-shadow: 2px 2px 4px rgba(66, 65, 65, 0.4);
  font-family: prompt;
}

#register .welcome-section h1 {
  font-size: 65px;
  margin-top: 5px;
  margin-bottom: 5px;
  padding: 20px;
}

#register .welcome-section h2 {
  font-size: 50px;
  margin-top: 5px;
  margin-bottom: 5px;
}

/* Styling for the Form container */
#register .form-container {
  background-color: var(--color-white);
  padding: 20px;
  margin-left: auto;
  margin-right: auto;
  border-radius: 8px;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
  width: 100%;
  max-width: 500px;
  max-height: 400px;
}

#register .form-container .form-input-group {
  display: flex;
  flex-direction: column;
  margin-bottom: 1rem;
  text-align: left;
  font-family: prompt;
}

#register .form-container .form-input-group label {
  margin-bottom: 0.25rem;
  font-size: 20px;
  color: var(--color-light-purple);
  font-weight: bold;
}

#register .form-container .form-input-group input[type="text"],
#register .form-container .form-input-group input[type="password"] {
  padding: 10px;
  border: 1px solid #ccc;
  border-radius: 4px;
  font-size: 20px;
  color: var(--color-light-purple);
}

/* Styling for the Create Account button */
#register .form-container button {
  padding: 10px;
  background-color: var(--color-dark-blue);
  color: #fff;
  font-weight: bold;
  font-size: 25px;
  font-family: prompt;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  width: 100%;
}

#register .form-container button:hover {
  background-color: var(--color-light-blue);
}

/* Styling for the Login link */
#register .form-container .login-link {
  font-size: 25px;
  color: var(--color-light-purple);
  font-family: prompt;
}

/* Styling for the Skyline section */
#register .skyline-section {
  grid-area: skyline-section;
  display: flex; /* Use flexbox to center the image */
  justify-content: center; /* Center the image horizontally */
  align-items: center; /* Center the image vertically */
  width: 100%; /* Ensure the container takes up full grid area width */
}

#register .skyline-section img {
  width: 1000px;
  height: 375px;
  object-fit: cover; /* Adjust to 'cover' for better aspect ratio handling */
  filter: drop-shadow(-10px -10px 10px #b5b6b8);
}
</style>