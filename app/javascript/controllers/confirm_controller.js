import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  ask(event) {
    const message =
      this.element.dataset.confirmMessage ||
      "新規タブで外部サイト(pinterest)を開きます。よろしいですか？"

    if (!window.confirm(message)) {
      event.preventDefault()
      event.stopImmediatePropagation()
    }
  }
}