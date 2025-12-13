import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["row", "rows"]
  static values = { options: String }

  connect() {
}

  add(event) {
    event.preventDefault()

    // 1. 現在の row の数を取得
    const lastIndex = this.rowTargets.length
    // 2. 次の行の HTML を生成
    const template = this._buildTemplate(lastIndex)
    // 3. controller （= #log-nails-container）の最後に HTML を追加
    this.rowsTarget.insertAdjacentHTML("beforeend", template)
  }

  remove(event) {
    event.preventDefault()
    event.target.closest(".log-nail-item").remove()
  }

  _buildTemplate(index) {
    // Rails から渡された <option> 一式を取得
    const options = this.optionsValue

    return `
      <div class="log-nail-item flex gap-2 mb-1" data-log-nails-target="row">
        <select name="naillog[log_nails_attributes][${index}][nail_item_id]",
                 class="select w-full text-xs">
          <option value="">--</option>
          ${options}
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
