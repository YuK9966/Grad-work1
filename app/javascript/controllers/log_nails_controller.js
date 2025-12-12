import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["row"]

  add(event) {
    event.preventDefault()

    const lastIndex = this.rowTargets.length
    const template = this._buildTemplate(lastIndex)

    this.element.insertAdjacentHTML("beforeend", template)
  }

  remove(event) {
    event.preventDefault()
    event.target.closest(".log-nail-item").remove()
  }

  _buildTemplate(index) {
    return `
      <div class="log-nail-item flex gap-2 mb-2" data-log-nails-target="row">
        <select name="naillog[log_nails_attributes][${index}][nail_item_id]"
                class="select w-full text-sm">
          ${this._options()}
        </select>
        <button type="button"
                data-action="log-nails#remove"
                class="btn btn-outline text-xs">
          削除
        </button>
      </div>
    `
  }

  _options() {
    return this.element.dataset.options
  }
}
