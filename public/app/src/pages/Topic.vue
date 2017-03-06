<template>
<div>
	<div class="row">
	  <h4>Topics to {{bot.name}}</h4>
	  <a class="waves-effect waves-light btn" @click="newTopic">New Topic</a>
	</div>

	<div class="row" style="height: 500px">
	  <!-- <intent-card v-for="intent in intents" :intent="intent"> </intent-card> -->
	  <dialogs v-for="topic in topics" :topic='topic'> </dialogs>
	</div>

	<modal-new-topic> </modal-new-topic>
</div>
</template>

<script>
  import store from '../store/store'
  import ModalNewTopic from '../components/ModalNewTopic.vue'
  import Dialogs from './Dialogs.vue'

  export default{
  	name: 'Topic', 
  	
  	mounted() {
      $('.modal').modal();
	  }, 

    created() {
      $.get('/bots/'+this.bot.id+'/topics').
      done((data) => {
        console.log(data)
        store.dispatch('setTopics', data)
      })

      $.get('/bots/'+this.bot.id+'/intents').
      done((data) => {
        store.dispatch('setIntents', data)
      })
    }, 

  	data() {
  	  return {}
  	}, 

  	methods: {
  	  newTopic: function(){
  	    $('#modal-new-topic').modal('open')
  	  }
  	}, 

  	computed:{
  	  bot: () => store.getters.currentBot, 
      topics: () => store.getters.topics
  	}, 

  	components: {
  	  ModalNewTopic, 
  	  Dialogs
  	}
  }
</script>