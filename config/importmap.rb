# Pin npm packages by running ./bin/importmap

pin 'application'
pin '@hotwired/turbo-rails', to: 'turbo.min.js'
pin '@hotwired/stimulus-loading', to: 'stimulus-loading.js'
pin_all_from 'app/javascript/controllers', under: 'controllers'
pin 'sortablejs' # @1.15.2

pin 'stimulus-use' # @0.52.2
pin "@hotwired/stimulus", to: "@hotwired--stimulus.js" # @3.2.2
pin "polaris-view-components" # @2.1.0
pin "@rails/request.js", to: "@rails--request.js.js" # @0.0.9
