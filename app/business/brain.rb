module Brain
  class Extractor
  	def self.extract!(*attr)
  	  new(*attr).extract!
  	end

  	def initialize(bot_id, options = {})
  	  @bot_instance = options.delete(:bot_instance) { Bot.find(bot_id) }
  	  @topic_repository = options.delete(:topic_repository) { Topic }
  	end

  	def extract!
  	  brain = []

  	  @bot_instance.topics.each do |topic|
  	  	topic.dialogs.each do |dialog| 
  	  		intent = dialog.intent
  	  		answsers = dialog.answers
  	  		brain.append(make_dialogs(intent, answsers))
  	  	end
  	  end
  	  brain
  	end

  	private

  	def make_dialogs(intent, answers)
  	  return [] if intent.nil?
  	  
  	  dialog = []
  	  intent.statements.each do |statement|
  	  	dialog_row = []
  	  	answers.each {|answer| dialog_row.append[statement, answer]}
  	  	dialog.append(dialog_row)
  	  end
  	  dialog
  	end
  end
end