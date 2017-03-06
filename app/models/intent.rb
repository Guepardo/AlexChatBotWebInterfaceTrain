class Intent < ApplicationRecord
  belongs_to :dialog, optional: true
  belongs_to :bot
  has_many :statements 
end
