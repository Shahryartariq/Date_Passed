<template>
  <div id="app">
    <h1>Personal Time Counters</h1>



    <!-- Tabs for Switching Between Time Counters -->
    <div class="tabs">
      <button v-for="(tab, index) in tabs" :key="index" :class="{ active: activeTab === index }"
        @click="activeTab = index">
        {{ tab }}
      </button>
    </div>

    <!-- Display the Active Time Counter -->
    <div v-if="activeTab === 0" class="tab-content">
      <h2>LTM</h2>
      <TimeCounter :startDate="new Date('2026-01-10T00:14:00')" />
    </div>
    <div v-if="activeTab === 1" class="tab-content">
      <h2>LTC</h2>
      <TimeCounter :startDate="new Date('2024-10-22T11:50:00')" />
    </div>
    <div v-if="activeTab === 2" class="tab-content">
      <h2>LTR</h2>
      <TimeCounter :startDate="new Date('2023-12-22T12:00:00')" />
    </div>
    <h1>🙂🙂🙂🙂</h1>
  </div>
</template>

<script>
import TimeCounter from './components/TimeCounter.vue';

export default {
  components: {
    TimeCounter,
  },
  data() {
    return {
      activeTab: 0,  // Keeps track of the active tab
      tabs: ['LTM', 'LTC', 'LTR']  // Tab titles
    };
  },
};
</script>

<style scoped>
#app {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  min-height: 100vh;
  text-align: center;
  background-color: #282c34;
  color: white;
  font-family: Arial, sans-serif;
}

h1 {
  font-size: 2rem;
  margin-bottom: 20px;
}

.tabs {
  display: flex;
  justify-content: center;
  margin-bottom: 20px;
}

button {
  background-color: #4caf50;
  border: none;
  padding: 10px 20px;
  margin: 0 10px;
  color: white;
  font-size: 1rem;
  cursor: pointer;
  border-radius: 5px;
  transition: background-color 0.3s ease;
}

button.active {
  background-color: #2e7d32;
}

button:hover {
  background-color: #66bb6a;
}

.tab-content {
  margin-top: 20px;
  animation: fadeIn 0.5s ease;
}

@keyframes fadeIn {
  from {
    opacity: 0;
  }

  to {
    opacity: 1;
  }
}

@media (max-width: 768px) {
  h1 {
    font-size: 1.5rem;
  }

  button {
    font-size: 0.9rem;
    padding: 8px 16px;
    margin: 0 5px;
  }

  .tab-content {
    font-size: 0.9rem;
  }
}
</style>
