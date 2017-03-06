<template>  
<div class="col s3 ">
  <div class="card blue-grey darken-1">
    <div class="card-content white-text">
      <span class="card-title">@{{dialog.name}}</span>
      <p>Possíveis conexões que o bot pode encontrar com uma pessoa querendo ir ao mercado</p>
    </div>
    <div class="card-action">
      <a href="#">Edit</a>
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