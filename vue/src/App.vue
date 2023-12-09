<template>
  <div id="capstone-app">
    <div id="nav">
      <!-- Add a class to the router-link elements -->
      

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
