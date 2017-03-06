<template>
<div>
	<div class="row">
	    <h4>My Bots</h4>
	    <a class="waves-effect waves-light btn" @click="newBot">New Bot</a>
	</div>

	<div class="row" style="height: 500px">
		<!-- bot content -->
		<bot-card v-for="bot in bots" :bot="bot" > </bot-card>
		<!-- bot content -->
	</div>

	<modal-new-bot></modal-new-bot>

</div>
</template>

<script>
import ModalNewBot from '../components/ModalNewBot.vue'
import BotCard from '../components/BotCard.vue'

import store from '../store/store'

export default{
  name: 'bot', 

  data (){
  	return {}
  }, 

  created(){
  	$.get('/bots').
  	done((data) => {
  		console.log(data)
  		store.dispatch('setBots', data)
  	})
  }, 

  methods: {
  	newBot: () => {
  	  $('#modal-new-bot').modal('open');
  	} 
  }, 

  computed:{
  	bots: () => {
  		return store.getters.bots
  	}
  }, 

  components: {
  	ModalNewBot, 
  	BotCard
  }, 
}
</script>