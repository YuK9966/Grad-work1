import { Application } from "@hotwired/stimulus"
// stimulus-autocompleteをインポート
import { Autocomplete } from 'stimulus-autocomplete'

const application = Application.start()
// autocompleteコントローラーを登録
application.register('autocomplete', Autocomplete)

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }
