class Topic < ApplicationRecord
  belongs_to :bot
  has_many :dialogs
end
