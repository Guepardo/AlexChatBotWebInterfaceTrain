<template>
<div id="modal-new-intent" class="modal">
  <div class="modal-content">
    <h4>{{label}} Intent</h4>
    <!-- Form -->
    <form id="new_intent_form"class="col s12">
       <div class="row">
         <div class="input-field col s12">
           <input name='name' type="text" class="validate" v-model='intent.name'>
           <label for="name">Intent Name</label>
         </div>
       </div>

       <div class="row">
         <div class="input-field col s12">
           <input name='description' type="text" class="validate" v-model='intent.description'>
           <label for="description">Description</label>
         </div>
       </div>

       <div class="row">
         <div class="col s12">
		    <table>
	         <thead>
	           <tr>
	               <th data-field="id">Statements</th>
	           </tr>
	         </thead>

	         <tbody>
	         <tr v-for="(statement, index) in statements"> 
	         	<td width="95%">{{statement}}</td> 
	         	<td>
	         		<a class="waves-effect waves-light btn" @click="removeStatement(index)">Remove</a>
	         	</td> 
	         </tr>
	       </tbody>
	     </table>       	       	
         </div>
       </div>

       <div class="row">
         <div class="input-field col s12">
           <input type="text" class="validate" v-model='statement' @keydown.enter="newStatement">
           <label for="first_name">New Statement</label>
         </div>
       </div>

     </form>
    <!-- Form -->
  </div>
  <div class="modal-footer">
    <button class="waves-effect waves-green btn-flat" @click="createIntent">Agree</button>
  </div>
</div>
</template>

<script>
import store from '../store/store'

export default{
	name:'ModalNewIntent', 
	
	data (){
	  return {
	  	intent: {id: null, name: '', description: ''}, 
	  	statements: [], 
	  	bot_id: 0
	  }
	}, 

	mounted (){
	  $('.modal').modal({
	  	ready: this.updateMode,
	  	complete: this.clearFields
	  })

	  if(this.bot_id == undefined)
	  	this.$router.push('/')
	}, 

	created (){
	  this.bot_id = store.getters.currentBot.id
	}, 

	methods: {
	  createIntent: function(){
	  	if(store.getters.intentUpdateMode)
	  		this.update()
	  	else
	  		this.save()
	  }, 

	  save: function(){
	  	let data = $('#new_intent_form').serializeArray()

	  	let statements = []
	  	for(let statement of this.statements){
	  		let temp = { text: statement }
	  		statements.push(temp)
	  	}

	  	data.push({name: 'bot_id', value: this.bot_id})

	  	$.post('/bots/'+this.bot_id+'/intents', data).
	  	done(function(data){
        store.dispatch('addIntent', data)
          console.log(data)
          for(let temp of statements){
          	$.post('/bots/'+this.bot_id+'/intents/'+data.id+'/statements', temp)
        	.done((data) => {
        	  console.log(data)
        	})
          }
          $('#modal-new-intent').modal('close')
	  	})
	  }, 

	  update: function(){
	  	let data = $('#new_intent_form').serializeArray()

	  	let statements = []
	  	for(let statement of this.statements){
	  		let temp = { text: statement }
	  		statements.push(temp)
	  	}

	  	data.push({name: 'bot_id', value: this.bot_id})

	  	let done = function(data){
          console.log(data)
          for(let temp of statements){
          	$.post('/bots/'+this.bot_id+'/intents/'+data.id+'/statements', temp)
        	.done((data) => {
        	  console.log(data)
        	})
          }
          $('#modal-new-intent').modal('close');
	  	}

	  	$.ajax({
	  		url:'/bots/'+this.bot_id+'/intents/'+this.intent.id, 
	  		method: 'PUT', 
	  		data: data, 
	  		success: done
	  	})
	  }, 

	  newStatement: function() {
	  	// TODO: não deixar cadastrar vazio. 
	  	this.statements.push(this.statement)
	  	this.statement = ''
	  }, 

	  removeStatement: function(index){
	  	this.statements.splice(index, 1)
	  }, 

	  updateMode: function(modal, trigger){
	  	let intentId = store.getters.intentUpdateMode
	  	let botId    = store.getters.currentBot.id

	  	console.log(this.intent)
	  	if(!intentId)
	  		return

	  	$.get('/bots/'+botId+'/intents/'+intentId).
	  	done((data) => {
	  		this.intent = data
	  	})

	  	this.statements = []
	  	$.get('/bots/'+this.bot_id+'/intents/'+intentId+'/statements').
	  	done((data) => {
          this.statements = data.map((item) => item.text )
        })
	  }, 

	  clearFields: function(){
	  	store.dispatch('setIntentUpdateMode', false)
	  	this.intent.id = null 
	  	this.intent.name = ''
	  	this.intent.description = ''
	  	this.statements = []
	  }
	},

	computed: {
		label: function(){
			return (store.getters.intentUpdateMode)? 'Update' : 'New'
		}
	}
}
</script>