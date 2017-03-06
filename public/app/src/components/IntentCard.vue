<template>
<div class="col s3 ">
  <div class="card blue-grey darken-1">
    <div class="card-content white-text">
      <span class="card-title">#{{intent.name}}</span>
      <p>{{intent.description}}</p>
    </div>
    <div class="card-action">
      <a @click='updateCard'>Edit</a>
    </div>
  </div>
</div>
</template>

<script>
import store from '../store/store'

export default{
  name: 'IntentCard', 
  
  props: ['intent'], 
    
  data(){
  	return { }
  }, 

  methods: {
    updateCard: function(){
      store.dispatch('setIntentUpdateMode', this.intent.id)
      $('#modal-new-intent').modal('open');
    }
  }
}
</script>