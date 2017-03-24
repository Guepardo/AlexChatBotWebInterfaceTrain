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
  	  		brain. << make_dialogs(intent, answsers)
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
  	  	answers.each {|answer| dialog_row << [get_text(statement), get_text(answer)]}
  	  	dialog << dialog_row unless dialog.nil?
  	  end
  	  dialog
  	end

  	def get_text(entity)
  	  entity.attributes['text']
  	end
  end
end