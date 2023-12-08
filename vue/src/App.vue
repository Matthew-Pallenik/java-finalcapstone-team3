<template>
  <div id="capstone-app">
    <div id="nav">
      <!-- Add a class to the router-link elements -->
      <router-link v-bind:to="{ name: 'home' }" class="nav-link">Home</router-link>&nbsp;|&nbsp;
      <router-link v-bind:to="{name: 'Pathway'}" class="nav-link">Pathway</router-link>&nbsp;|&nbsp;
      <router-link v-bind:to="{name: 'Curriculum'}" class="nav-link">Curriculum</router-link>&nbsp;|&nbsp;
      <router-link v-bind:to="{name: 'Jobs'}" class="nav-link">Jobs</router-link>&nbsp;|&nbsp;
      <router-link v-bind:to="{name: 'AskForHelp'}" class="nav-link">Ask For Help</router-link>&nbsp;|&nbsp;
      <router-link v-bind:to="{ name: 'logout' }" v-if="$store.state.token != ''" class="nav-link">Logout</router-link>
      

    </div>
    <router-view />
  </div>
</template>
<style scoped>
#nav {
  display: flex;
  justify-content: flex-end; /* Aligns content to the right */  
  padding: 10px;
  margin-top: 20px;
  text-align: center;
  font-size: 25px;
  text-shadow: 2px 2px 4px rgba(66, 65, 65, 0.2);
}

.nav-link {
  margin-left: 10px; /* Space between links */
}

/* Styles for router-link */
</style>
