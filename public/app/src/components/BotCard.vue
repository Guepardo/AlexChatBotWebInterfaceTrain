<template>
<div class="col s3">
 <div class="card-panel z-depth-3">
  <h5>{{bot.name || 'Undefined'}}</h5>
   <span class="black-text"></span>
   <a class="waves-effect waves-teal btn-flat" @click="selectBot">Select bot</a>
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