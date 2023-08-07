# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable

  has_many :user_projects, dependent: :destroy
  has_many :projects, through: :user_projects
  has_many :tasks, through: :projects

  after_create :create_inbox

  validates :name, presence: true, length: { maximum: 255 }

  private

  def create_inbox
    projects.create!(name: 'Inbox', is_inbox: true)
  end
end
