# frozen_string_literal: true

class DropdownMenuItemComponent < ViewComponent::Base
  erb_template <<-ERB
    <button class="px-4 py-2 hover:bg-gray-100 flex w-full">
      <%= content %>
    </button>
  ERB
end
