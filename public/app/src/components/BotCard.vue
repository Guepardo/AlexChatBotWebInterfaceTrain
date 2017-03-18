<template>
<div class="col s4">
 <div class="card-panel z-depth-3">
  <h5 class="center-align">{{bot.name || 'Undefined'}}</h5>
   <span class="black-text"></span>

   <div class="row">
     <div class="col s6">
         <a class="waves-effect waves-light btn" @click="selectBot">Select</a>       
     </div>
     <div class="col s6">
         <a class="waves-effect waves-light btn" @click="selectBot">Delete</a>              
     </div>
   </div>
 </div>
</div>	
</template>

<script>
  import store from '../store/store'

  export default{
  	name: 'BotCard', 
  	
  	props: ['bot'], 

  	data () {
  	  return { }
  	}, 

    methods:{
      selectBot: function () {
        store.dispatch('setCurrentBot', this.bot)
        this.$router.push('topic')
      }
    }
  }
</script>