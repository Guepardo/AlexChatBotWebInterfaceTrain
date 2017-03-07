class Dialog < ApplicationRecord
  belongs_to :topic
  belongs_to :dialog, optional: true
  has_one :intent
  has_many :answers
end
