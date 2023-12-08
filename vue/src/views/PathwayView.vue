<template>
    <div class="home grid-container">
      <!-- ... other elements in the homeview ... -->
  
      <!-- Middle Row - Pathway View -->
      <div class="grid-item pathway-view">
        <div class="pathways-header">
          <h2>Pathways</h2>
        </div>
        <div class="pathways-content">
          <div class="pathway-item" v-for="pathway in pathways" :key="pathway.id">
            <div class="pathway-title">{{ pathway.title }}</div>
            <!-- Additional pathway content can go here -->
          </div>
        </div>
        <div class="pathways-footer">
          <input type="text" placeholder="Input Routes Back to homeview">
        </div>
      </div>
  
      <!-- ... remaining elements in the homeview ... -->
    </div>
  </template>