# frozen_string_literal: true

class Task < ApplicationRecord
  belongs_to :project
  has_many :users, through: :project

  validates :title, presence: true, length: { maximum: 100 }
end
