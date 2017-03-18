<style>
  .max-height-card-intent{
    min-height: 200px; 
    max-height: 200px;
  }    
</style>

<template>
<div class="col s3">
  <div class="card blue-grey darken-1 max-height-card-intent">
    <div class="card-content white-text">
      <span class="card-title">#{{intent.name}}</span>
      <p>{{intent.description}}</p>
    </div>
<!--     <div class="card-action">
      <a >Edit</a>
    </div> -->
    <div class="row" style="position:absolute;bottom:0;">
      <div class="col s6">
        <a class="btn-floating waves-effect waves-light blue" @click='updateCard'><i class="material-icons">edit</i></a>         
      </div>
      <div class="col s6">
        <a class="btn-floating waves-effect waves-light blue"><i class="material-icons">delete</i></a>                 
      </div>
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