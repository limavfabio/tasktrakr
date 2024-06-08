# frozen_string_literal: true

class DialogComponent < ViewComponent::Base
  def initialize(open_button: 'Open Modal', close_button: 'Close Modal')
    @close_button = close_button
    @open_button = open_button
  end
end
