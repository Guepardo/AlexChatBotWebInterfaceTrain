import Vue from 'vue'
import Vuex from 'vuex'

Vue.use( Vuex )

const state = {
  bots: [],
  intents: [],  
  topics: [], 
  currentBot: 'undefined', 
  intentUpdateMode: false
}

const mutations = {
  ADD_BOT(state, bot){
	  state.bots.push(bot)
  }, 

  ADD_TOPIC(state, topic){
    state.topics.push(topic)
  }, 

  SET_BOTS(state, bots){
  	state.bots = bots
  }, 

  ADD_INTENT(state, intent){
    state.intents.push(intent)
  }, 

  SET_INTENTS(state, intents){
    state.intents = intents
  }, 

  SET_CURRENT_BOT(state, botId){
  	state.currentBot = botId
  }, 

  SET_TOPICS(state, topics){
    state.topics = topics
  }, 

  SET_INTENT_UPDATE_MODE(state, intentId){
    state.intentUpdateMode = intentId
  }
}

const actions = {
  addBot({commit}, bot){
	commit('ADD_BOT', bot)
  }, 

  setBots({commit}, bots){
  	commit('SET_BOTS', bots)
  }, 

  addIntent({commit}, intent){
    commit('ADD_INTENT', intent)
  }, 

  addTopic({commit}, topic){
    commit('ADD_TOPIC', topic)
  }, 

  setIntents({commit}, intents){
    commit('SET_INTENTS', intents)
  }, 

  setTopics({commit}, topics){
    commit('SET_TOPICS', topics)
  }, 

  setCurrentBot({commit}, bot){
  	commit('SET_CURRENT_BOT',bot)
  }, 

  setIntentUpdateMode({commit}, intentId){
    commit('SET_INTENT_UPDATE_MODE', intentId)
  }
}

const getters = {
  bots: state => state.bots, 
  intents: state => state.intents,
  topics: state => state.topics, 
  currentBot: state => state.currentBot, 
  intentUpdateMode: state => state.intentUpdateMode
}

export default new Vuex.Store({state, mutations, actions, getters})