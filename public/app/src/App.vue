<template>
  <div id="app">
    <navbar> </navbar>
    <div class="container">
    	<router-view></router-view>
    </div>
  </div>
</template>

<script>
import store from './store/store'
import Navbar from './components/Navbar.vue'

export default {
  name: 'app', 

  created(){
    
  }, 

  components: {
    Navbar
  }
}
</script>
