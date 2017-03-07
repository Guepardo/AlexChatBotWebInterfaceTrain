<template>
<div id="modal-new-topic" class="modal">
  <div class="modal-content">
    <h4>New Topic</h4>
    <!-- Form -->
    <form id="new_topic_form"class="col s12">
       <div class="row">
         <div class="input-field col s12">
           <input name='name' type="text" class="validate" v-model='topic.name'>
           <label for="first_name">Topic Name</label>
         </div>
       </div>
     </form>
    <!-- Form -->
  </div>
  <div class="modal-footer">
    <button class="waves-effect waves-green btn-flat" @click="createTopic" >Agree</button>
  </div>
</div>	
</template>

<script>
import store from '../store/store'

export default{
	name: 'ModalNewTopic', 

	data(){
    return {
      topic: {id: null, name: ''}
    }
	}, 

  created (){
    this.botId = store.getters.currentBot.id
  }, 

  methods: {
    createTopic: function(){
      let data = $('#new_topic_form').serializeArray()
    
      $.post('/bots/'+this.botId+'/topics', data).
      done(function(data){
        store.dispatch('addTopic', data)
        $('#modal-new-topic').modal('close')
      })

    }
  }
}
</script>