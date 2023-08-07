# frozen_string_literal: true

class Project < ApplicationRecord
  has_many :tasks, dependent: :destroy
  has_many :user_projects, dependent: :destroy
  has_many :users, through: :user_projects

  validates :name, presence: true, length: { maximum: 255 }

  # validate :inbox_rules, if: :is_inbox?

  # def inbox_rules
  #   # Rule 1: A user can only have a single inbox project
  #   if user.projects.where(is_inbox: true).where.not(id: id).exists?
  #     errors.add(:is_inbox, "A user can only have one inbox project.")
  #   end

  #   # Rule 2: An inbox project can't be destroyed unless the user is destroyed
  #   throw(:abort) if destroyed? && is_inbox?

  #   # Rule 3: An inbox project can't be edited
  #   if is_inbox? && (name_changed? || is_inbox_changed?)
  #     errors.add(:base, "The inbox project cannot be edited.")
  #   end
  # end

end
