# frozen_string_literal: true

class DropdownButtonComponent < ViewComponent::Base
  erb_template <<-ERB
    <button type="button" data-action="dropdown#toggle click@window->dropdown#hide">
      <%= content %>
    </button>
  ERB
end
