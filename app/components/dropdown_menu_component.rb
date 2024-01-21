# frozen_string_literal: true

class DropdownMenuComponent < ViewComponent::Base
  erb_template <<-ERB
      <div
      data-dropdown-target="menu"
      class="
        hidden transition transform origin-top-right absolute right-0 bg-white
        divide-gray-100 rounded-lg w-44 shadow divide-y z-10 p-3
      "
      data-transition-enter-from="opacity-0 scale-95"
      data-transition-enter-to="opacity-100 scale-100"
      data-transition-leave-from="opacity-100 scale-100"
      data-transition-leave-to="opacity-0 scale-95"
    >
      <ul class="py-2 text-gray-800">
        <%= content %>
      </ul>
    </div>
  ERB
end
