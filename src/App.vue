<template>
  <div id="app" class="time-passed">
    <h1>Time Passed</h1>
    <div class="time-counter">
      <!-- <p>Since {{ startDate.toLocaleString() }},</p> -->
      <div class="time-unit">
        <span>{{ days }}</span>
        <label>Days</label>
      </div>
      <div class="time-unit">
        <span>{{ hours }}</span>
        <label>Hours</label>
      </div>
      <div class="time-unit">
        <span>{{ minutes }}</span>
        <label>Minutes</label>
      </div>
      <div class="time-unit">
        <span>{{ seconds }}</span>
        <label>Seconds</label>
      </div>

    </div>
    <h1>🙂</h1>
  </div>
</template>

<script>
export default {
  data() {
    return {
      startDate: new Date('2024-09-21T20:56:00'), // Replace with your desired start date
      days: 0,
      hours: 0,
      minutes: 0,
      seconds: 0,
      interval: null,
    };
  },
  mounted() {
    this.calculateTimePassed();
    this.interval = setInterval(this.calculateTimePassed, 1000);
  },
  beforeUnmount() {
    clearInterval(this.interval);
  },
  methods: {
    calculateTimePassed() {
      const now = new Date();
      const timeDiff = now.getTime() - this.startDate.getTime();
      this.days = Math.floor(timeDiff / (1000 * 3600 * 24));
      this.hours = Math.floor((timeDiff % (1000 * 3600 * 24)) / (1000 * 3600));
      this.minutes = Math.floor((timeDiff % (1000 * 3600)) / (1000 * 60));
      this.seconds = Math.floor((timeDiff % (1000 * 60)) / 1000);
    },
  },
};
</script>

<style scoped>
#app {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  height: 100vh;
  text-align: center;
  background-color: #282c34;
  color: white;
  font-family: Arial, sans-serif;
}

h1 {
  font-size: 2rem;
  margin-bottom: 20px;
}

.time-counter {
  display: flex;
  justify-content: center;
  align-items: center;
  flex-wrap: wrap;
}

.time-unit {
  display: flex;
  flex-direction: column;
  align-items: center;
  margin: 10px;
}

.time-unit span {
  font-size: 2rem;
  font-weight: bold;
}

.time-unit label {
  font-size: 1rem;
  margin-top: 10px;
}
</style>
