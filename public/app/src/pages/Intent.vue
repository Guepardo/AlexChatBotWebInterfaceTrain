<template>
<div>
	<div class="row">
	  <h4>Intents &{{bot.name}}</h4>
	  <a class="waves-effect waves-light btn" @click="newIntent">New Intent</a>
	</div>

	<div class="row" style="height: 500px">
	  <intent-card v-for="intent in intents" :intent="intent"> </intent-card>
	</div>

	<modal-new-intent> </modal-new-intent>
</div>
</template>

<script>
  import IntentCard from '../components/IntentCard.vue'
  import ModalNewIntent from '../components/ModalNewIntent.vue'
  import store from '../store/store'

  export default{
    name: 'Intent', 

    data () {
    	return { }
    }, 

    created () {
      let id = store.getters.currentBot.id 

      $.get('/bots/'+id+'/intents')
      .done((data) =>{
        store.dispatch('setIntents', data)
      })  
    }, 

    methods:{
      newIntent: () => { 
      	$('#modal-new-intent').modal('open')
      }
    },

    computed:{
    	bot: () => store.getters.currentBot, 
      intents: () => store.getters.intents
    }, 

    components: {
    	ModalNewIntent, 
    	IntentCard
    }
  }
</script>