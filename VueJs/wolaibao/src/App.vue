<template>
  <div id="apps">
    <home-index></home-index>
    <router-view></router-view>
  </div>
</template>

<script>
  import HomeIndex from './components/home/home.vue'
  export default {
    name: 'apps',
    components: {
      HomeIndex
    }
  }
</script>
<style>
  @import "assets/css/reset.css";
</style>
