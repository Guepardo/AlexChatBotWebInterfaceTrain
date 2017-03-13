  <template>
<div class="row">
<hr>
  <h5>{{topic.name}} 
    <a class="btn-floating waves-effect waves-light" @click="createDialog"><i class="material-icons">add</i></a> 
  </h5>

  <dialog-card v-for="dialog in dialogs" :dialog="dialog"> </dialog-card>

  <modal-new-dialog> </modal-new-dialog>
</div>
</template>

<script>
import store from '../store/store'
import DialogCard from '../components/DialogCard.vue'
import ModalNewDialog from '../components/ModalNewDialog.vue'

export default{
  name: 'Dialogs', 

  props: ['topic'], 

  created() {
    this.updateDialogs()
    this.$on('updateOnNewDialog', function(){
       alert('Olar')
       this.updateDialogs()
    })
  }, 

  mounted(){
  	$('.modal').modal()
  }, 

  data(){
    return {
    	dialogs: []
    }
  }, 

  methods: {
  	createDialog: function(){
      store.dispatch('setCurrentTopic', this.topic)
      $('#modal-new-dialog').modal('open')
  	}, 

    updateDialogs: function(){
      let botId = store.getters.currentBot.id
      $.get('/bots/'+botId+'/topics/'+this.topic.id+'/dialogs').
      done((data) => {
        this.dialogs = data
      });
    }
  }, 

  components: {
  	DialogCard, 
  	ModalNewDialog
  }
}
</script>