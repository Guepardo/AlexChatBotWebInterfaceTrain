<template>
<div id="modal-new-dialog" class="modal" style="min-heigth:500px;" >
  <div class="modal-content">
    <h4>New Dialog</h4>
    <!-- Form -->
    <form id="new_dialog_form"class="col s12">
       <div class="row">
         <div class="input-field col s12">
           <input name='name' type="text" class="validate" v-model='name'>
           <label for="first_name">Dialog Name</label>
         </div>
       </div>


       <div class="row">
         <div class="input-field col s12">
            <select name="intent_id">
    		      <option value="" disabled selected>Choose your option</option>
    		      <option v-for="intent in intents" v-bind:value="intent.id" >#{{intent.name}}</option>
    		    </select>
    		    <label>Select an Intent</label>
         </div>
       </div>

       <div class="row">
         <div class="col s12">
		    <table>
	         <thead>
	           <tr>
	               <th data-field="id">Answers</th>
	           </tr>
	         </thead>

	         <tbody>
	         <tr v-for="(answer, index) in answers"> 
	         	<td width="95%">{{answer}}</td> 
	         	<td>
	         		<a class="waves-effect waves-light btn" @click="removeAnswer(index)">Remove</a>
	         	</td> 
	         </tr>
	       </tbody>
	     </table>       	       	
         </div>
       </div>

         <div class="row">
         <div class="input-field col s12">
           <input type="text" class="validate" v-model='answer' @keydown.enter="newAnswer">
           <label for="first_name">New Answer</label>
         </div>
       </div>

     </form>
    <!-- Form -->
  </div>
  <div class="modal-footer">
    <button class="waves-effect waves-green btn-flat" @click="createDialog">Agree</button>
  </div>
</div>
</template>

<script >
import store from '../store/store'

export default{
  name: 'ModalNewDialog', 

  mounted(){
  	$('select').material_select();
  }, 

  data() {
  	return { 
  	  answers: []
  	}
  }, 

  methods: {
  	newAnswer: function (){
  	  this.answers.push(this.answer)
	    this.answer = ''
  	}, 

  	removeAnswer: function(index){
  	  this.answers.splice(index, 1)
  	}, 

  	createDialog: function(){
      let botId = store.getters.currentBot.id
      let topicId = store.getters.currentTopic.id
  		let data = $('#new_dialog_form').serializeArray()

      let answers = []
      for(let answer of this.answers){
        let temp = { text: answer }
        answers.push(temp)
      }

      $.post('/bots/'+this.bot_id+'/topics/'+topicId+'/dialogs', data).
      done((sub_data) => {
        store.dispatch('addIntent', sub_data)
          console.log(sub_data)
          for(let temp of answers){
            $.post('/bots/'+botId+'/topics/'+topicId+'/dialogs/'+sub_data.id+'/answers', temp)
            .done((sub_data) => {
              console.log(sub_data)
            })
          }
          this.$emit('updateOnNewDialog')
          $('#modal-new-dialog').modal('close')
      })
  	}
  }, 

  computed: {
  	intents: () => store.getters.intents
  }
}
</script>