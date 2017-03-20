<style>
	
</style>

<template>
<div class="navbar-fixed">
  <nav>
    <div class="nav-wrapper">
      <a href="#!" class="brand-logo">Logo</a>
      <ul class="right hide-on-med-and-down" v-show="botName">
        <li><a href="">Generate Brain to {{botName}}</a></li>
      </ul>
    </div>
  </nav>
</div>
</template>

<script>
  import store from '../store/store'

  export default {
  	name: 'navbar',
    
    computed:{
      botName: () => store.getters.currentBot.name
    }
  }
</script>