class Bot < ApplicationRecord
  has_many :topics
  has_many :intents
end
