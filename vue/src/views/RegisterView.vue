<template>
  <!--added -register-container to grab this and manipulate it with css-->
  <div id="register" class="register-container text-center">
    <h1>Welcome to Chatbot</h1>
    <h2>Create Account</h2>
    <!-- also added -container to this so that we make the form a box to manipulate with css-->
    <div class="form-container">
      <form v-on:submit.prevent="register">

        <div role="alert" v-if="registrationErrors">
          {{ registrationErrorMsg }}
        </div>
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
        <button type="submit">Create Account</button>
        <p>
          <!--added class login-link to manipulate this text with css-->
          <router-link class="login-link" v-bind:to="{ name: 'login' }">Already have an account? Log in.</router-link>
        </p>
      </form>
    </div>
  </div>
  <!--add footer for the chicago skyline-->
  <div class="footer">
    <img src="img/Chicago-Grey.png" alt="City Skyline">
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
h1,
h2 {
  color: var(--color-darker-purple);
  text-align: center;
  text-shadow: 2px 2px 4px rgba(66, 65, 65, 0.4);
}

h1 {
  font-size: 65px;
  margin-top: 35px;
  padding: 20px;
}

h2 {
  font-size: 50px;
}


.form-container {
  background-color: var(--color-light-purple);
  padding: 20px;
  margin-top: 20px;
  margin-left: auto;
  /* Centering horizontally */
  margin-right: auto;
  /* Centering horizontally */
  border-radius: 8px;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
  width: 100%;
  max-width: 500px;
  max-height: 350px;
  /* Adjust as needed */

}
.form-input-group {
  display: flex;
  font-size: 16px; /* Reduced font size */
  font-weight: bold;
  color: var(--color-darker-purple);
  flex-direction: column;
  margin-bottom: 0.5rem; /* Reduced bottom margin */
  text-align: left;
}

.form-input-group label {
  margin-bottom: 0.25rem; /* Reduced bottom margin */
}

.form-input-group input[type="text"],
.form-input-group input[type="password"] {
  padding: 5px; /* Reduced padding */
  margin-top: 3px; /* Reduced top margin */
  margin-bottom: 8px; /* Reduced bottom margin */
  border: none;
  outline: none;
  border-radius: 4px;
  font-size: 16px; /* Reduced font size */
  color: var(--color-darker-purple);
}

button {
  padding: 10px;
  background-color: var(--color-darker-purple);
  color: #fff;
  font-weight: bold;
  font-size: 25px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  width: 100%;
}


button:hover {
  background-color: var(--color-light-blue);
}

.login-link {
  font-size: 25px;
}

.error-message {
  color: red;
  margin-bottom: 15px;
}


.form-input-group {
  margin-bottom: 1rem;
}

label {
  margin-right: 0.5rem;
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
/* Tablet size @media query */
@media (min-width: 768px) and (max-width: 1024px) {
  h1 {
    font-size: 45px;
    margin-top: 0px;
    margin-bottom: 0px;
  }

  h2 {
    margin-top: 0px;
    margin-bottom: 0px;
    font-size: 30px;
  }

  .form-container {
    max-width: 550px;
    max-height: 450px;
    padding: 30px;
    
  }

  .form-input-group {
    font-size: 22px;
  }

  .form-input-group input[type="text"],
  .form-input-group input[type="password"] {
    font-size: 22px;
  }

  button {
    font-size: 22px;
  }

  .footer {    
    height: fit-content;
  }

  .footer img {
    max-height: 250px;
  }

}

/* Phone size @media query */
@media (max-width: 767px) {
  h1 {
    font-size: 45px; /* Reduced font size for smaller screens */
    margin-top: 10px; /* Adjusted top margin */
    padding: 0px; /* Adjusted padding */
  }

  h2 {
    font-size: 40px; /* Smaller font size for h2 */
  }

  .form-container {
    max-width: 80%; /* Full width for smaller screens */
    padding: 15px; /* Adjusted padding */
    margin-top: 0px; /* Smaller top margin */
  }

  .form-input-group {
    font-size: 18px; /* Smaller font size for readability */
  }

  .form-input-group input[type="text"],
  .form-input-group input[type="password"] {
    font-size: 18px; /* Larger font size for touch targets */
  }

  button {
    font-size: 20px; /* Adjusted button font size for easier interaction */
  }

  .footer {
    height: fit-content; /* Adjusted footer height */
  }

  .footer img {
    height: fit-content; /* Adjusted image size in the footer */
  }

  .login-link {
    font-size: 20px;
  }
}
/* Phone size @media query for screens up to 360px wide */
@media (max-width: 360px) {
  h1 {
    font-size: 30px; /* Reduced font size */
    margin-top: 10px; /* Adjusted top margin */
    padding: 0px; /* Adjusted padding */
  }

  h2 {
    font-size: 25px; /* Smaller font size */
  }

  .form-container {    
  max-width: 80%; /* Utilize available space */
  max-height: 300px; /* Maximum height of the container */
  padding: 10px; /* Reduced padding */
  margin-top: 0px; /* Smaller top margin */
  margin-bottom: 20px; /* Added bottom margin for spacing before footer */
  overflow-y: auto; /* Enable scrolling for overflow content */
}

.form-input-group {
  font-size: 16px; /* Reduced font size */
  margin-bottom: 8px; /* Reduced margin between groups */
}

.form-input-group input[type="text"],
.form-input-group input[type="password"] {
  font-size: 16px; /* Adjusted font size for inputs */
  padding: 8px; /* Reduced padding for inputs */
  margin-bottom: 8px; /* Reduced margin between inputs */
}

button {
  font-size: 18px; /* Adjusted button font size */
  padding: 8px; /* Reduced button padding */
  margin-bottom: 8px; /* Space below the button */
}
  .footer {
    height: auto; /* Height set to auto for adaptive sizing */
  }

  .footer img {
    height: 250px; /* Adjusted image size in the footer */
  }

  .login-link {
    font-size: 18px; /* Adjusted font size for links */
  }
}
</style>
