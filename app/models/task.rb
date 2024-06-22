# frozen_string_literal: true

class Task < ApplicationRecord
  belongs_to :project, dependent: :destroy
  has_many :users, through: :project
  acts_as_list scope: :project

  validates :title, presence: true, length: { maximum: 100 }
  validates :completed, inclusion: { in: [true, false] }
end
