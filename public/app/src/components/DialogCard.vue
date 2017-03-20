<style>
  .max-height-card-dialog{
    min-height: 300px; 
    max-height: 300px;
  }  
</style>

<template>  
<div class="col s3">
  <div class="card blue-grey darken-1 max-height-card-dialog">
    <div class="card-content white-text">
      <span class="card-title">@{{dialog.name}}</span>
      <p>Possíveis conexões que o bot pode encontrar com uma pessoa querendo ir ao mercado</p>
    </div>

    <div class="row" style="position:absolute;bottom:0;">
      <div class="col s6">
        <a class="btn-floating waves-effect waves-light blue"><i class="material-icons">edit</i></a>         
      </div>
      <div class="col s6">
        <a class="btn-floating waves-effect waves-light blue"><i class="material-icons">delete</i></a>                 
      </div>
    </div>
  </div>
</div>
</template>

<script>
  export default{
  	name: 'DialogCard', 

    props: ['dialog'], 

  	data() {
  	  return {}
  	}
  }
</script>