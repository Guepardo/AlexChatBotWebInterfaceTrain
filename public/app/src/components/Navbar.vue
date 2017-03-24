<style>
	
</style>

<template>
<div class="navbar-fixed">
  <nav>
    <div class="nav-wrapper">
      <a href="#!" class="brand-logo">Logo</a>
      <ul class="right hide-on-med-and-down" v-show="botName">
        <li><a v-bind:href="generateBrainLink()">Generate Brain to {{botName}}</a></li>
      </ul>
    </div>
  </nav>
</div>
</template>

<script>
  import store from '../store/store'

  export default {
  	name: 'navbar',
    
    methods: {
      generateBrainLink: function(){
        return '/bots/'+ this.botId +'/brain' 
      }
    }, 
    computed:{
      botName: () => store.getters.currentBot.name,
      botId: () => store.getters.currentBot.id
    }
  }
</script>