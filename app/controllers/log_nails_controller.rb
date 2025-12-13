class LogNailsController < ApplicationController
  def create
    @naillog = Naillog.new(naillog_params.merge(user: current_user))

    if @naillog.save
      LogNail.create!(
        naillog_id: @naillog.id,
        nail_item_id: @naillog.nail_item_id
      )
      redirect_to @naillog, notice: "登録しました"
    else
      load_nail_items
      render :new, status: :unprocessable_entity
    end
  end
end
