<template>
  <!--added login-container to grab this and manipulate it with css-->
  <div id="login" class="login-container text-center">
    <!-- also added -container to this so that we make the form a box to manipulate with css-->
    <h1>Please Sign In</h1>
    <div class="form-container">
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
  </div>
  <!--add footer for the chicago skyline-->
  <div class="footer">
    <img src="img/Chicago-Grey.png" alt="City Skyline">
  </div>
</template>

<script>
import authService from "../services/AuthService";

export default {
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
h1,
h2 {
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
  /* Adjust as needed */

}

.form-input-group {
  display: flex;
  font-size: 25px;
  font-weight: bold;
  color: var(--color-darker-purple);
  flex-direction: column;
  margin-bottom: 1rem;
  text-align: left;
}

.form-input-group label {
  margin-bottom: 0.5rem;
}

.form-input-group input[type="text"],
.form-input-group input[type="password"] {
  padding: 10px;
  margin-top: 5px;
  margin-bottom: 15px;
  border: none;
  outline: none;
  border-radius: 4px;
  font-size: 25px;
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

.register-link {
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
}</style>