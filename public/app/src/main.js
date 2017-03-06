// The following line loads the standalone build of Vue instead of the runtime-only build,
// so you don't have to do: import Vue from 'vue/dist/vue'
// This is done with the browser options. For the config, see package.json
import Vue from 'vue'
import VueRouter from 'vue-router'

import App from './App.vue'
import Bot from './pages/Bot.vue'
import Intent from './pages/Intent.vue'
import Topic from './pages/Topic.vue'

Vue.use( VueRouter )
import store from './store/store.js'


const routes = [
  { path: '/', component: Bot }, 
  { path: '/intent', component: Intent }, 
  { path: '/topic', component: Topic }
]

const router = new VueRouter({
  routes
})

new Vue({ // eslint-disable-line no-new
  store: store,
  router: router, 
  el: '#app',
  render: (h) => h(App)
})

