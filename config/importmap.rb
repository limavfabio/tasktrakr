# Pin npm packages by running ./bin/importmap

pin 'application'
pin '@hotwired/turbo-rails', to: 'turbo.min.js'
pin '@hotwired/stimulus', to: 'stimulus.min.js'
pin '@hotwired/stimulus-loading', to: 'stimulus-loading.js'
pin_all_from 'app/javascript/controllers', under: 'controllers'

pin_all_from 'app/javascript/channels', under: 'channels'
pin_all_from 'app/javascript/helpers', under: 'helpers'
pin '@rails/actioncable', to: 'actioncable.esm.js'
pin 'sortablejs' # @1.15.2

pin 'stimulus-use' # @0.52.2
