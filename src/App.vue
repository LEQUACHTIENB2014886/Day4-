<template>
  <div id="app">
    <Header />
    <router-view />
    <!-- Đây là nơi các trang sẽ được render -->
    <Footer />
  </div>
</template>

<script setup>
import Header from "./components/Header.vue";
import Footer from "./components/Footer.vue";
</script>

<style scoped>
/* #app {
  width: 100%;
  height: 100vh;
  background: linear-gradient(to right, azure, white, azure);
} */
</style>