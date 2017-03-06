class Dialog < ApplicationRecord
  belongs_to :topic
  belongs_to :dialog
  has_one :intent
  has_many :answers
end
