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
      </div>
      <div class="grid-item middle-center pathway-content">
        <!-- Pathway content goes here -->
        <div v-for="pathway in pathways" :key="pathway.id" class="pathway-item">
          <div class="pathway-title">{{ pathway.title }}</div>
        </div>
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
        <!-- This cell is intentionally left empty -->
      </div>
    </div>
  </template>

<script>
export default {
    mounted() {
    document.title = "Pathway";
  },
}
</script>

<style scoped>
.grid-container {
  display: grid;
  grid-template-columns: repeat(3, 1fr); /* Three columns of equal size */
  grid-template-rows: auto auto auto; /* Three rows, size determined by content */
  gap: 10px; /* Space between grid items */
}

/* Assign the grid-template-areas to match the layout */
.grid-container {
  grid-template-areas:
    "logo welcome empty1"
    "nav pathway-content motivational-quotes"
    "empty2 skyline empty3";
}

/* Place each grid-item in the correct grid area */
.logo { 
    grid-area: logo; 
    display: flex;
    justify-content:center;
    align-items:center;
    margin-top: 0px;
    margin-left: 100px;
    filter: drop-shadow(-1px -1px 1px #b5b6b8); /* Shadow effect for depth */  
    
}

#TE Logo {
    width: 250px; /* You may set a max-width instead if the image is too large */
    height: auto; /* Maintain aspect ratio */
    
}
.welcome { 
    grid-area: welcome; 
    display: flex;
    justify-content: center;
    align-items: center ;
    font-family: prompt;
    font-size: 45px;
    color: var(--color-pink);
    text-shadow: 2px 2px 4px rgba(66, 65, 65, 0.4);
}
/* empty1 does not need a style since it is intentionally left empty */

.nav { grid-area: nav; }
.pathway-content { grid-area: pathway-content; }
.motivational-quotes { grid-area: motivational-quotes; }

/* empty2 and empty3 do not need styles since they are intentionally left empty */

.skyline { 
    grid-area: skyline; 
    filter: drop-shadow(-10px -10px 10px #b5b6b8); /* Shadow effect for depth */  
}
</style>