<template>
<div id="modal-new-bot" class="modal">
  <div class="modal-content">
    <h4>New Bot</h4>
    <!-- Form -->
    <form id="new_bot_form"class="col s12">
       <div class="row">
         <div class="input-field col s12">
           <input name='name' type="text" class="validate" v-model='name'>
           <label for="first_name">Bot name</label>
         </div>
       </div>
     </form>
    <!-- Form -->
  </div>
  <div class="modal-footer">
    <button class="waves-effect waves-green btn-flat" @click="createBot">Agree</button>
  </div>
</div>
</template>

<script>
import store from '../store/store'

export default{
	name:'ModalNewBot', 
	
	data (){
	  return {}
	}, 

  mounted() {
    $('.modal').modal();
  }, 

	methods: {
	  createBot: () => {
	  	let data = $('#new_bot_form').serializeArray()

	  	$.post('/bots', data).
	  	done((data) => {
	  		console.log(data)
        store.dispatch('addBot', data)
	  		$('#modal-new-bot').modal('close');
	  	})

	  }
	}

}
</script>