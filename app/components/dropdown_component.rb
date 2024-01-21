class DropdownComponent < ViewComponent::Base
  erb_template <<-ERB
    <div data-controller="dropdown" class="relative">
      <%= content %>
    </div>
  ERB
end
