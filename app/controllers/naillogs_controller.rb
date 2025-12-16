class NaillogsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create edit]
  before_action :set_naillog, only: %i[show edit update destroy]
  before_action :load_nail_items, only: %i[new create edit update]

  def index
    @naillogs = Naillog.where(status: "published").order(created_at: :desc)
  end

  def new
    @naillog = Naillog.new
    @naillog.log_nails.build
  end

  def create
    @naillog = current_user.naillogs.new(naillog_params)
    # formのボタンでstatusを設定
    @naillog.status = (params[:commit] == "下書き") ? "draft" : "published"
    if @naillog.save
      if @naillog.status == "draft"
        redirect_to edit_naillog_path(@naillog), notice: "下書き保存しました"
      else
        redirect_to naillogs_path, notice: "投稿しました"
      end
    else
      load_nail_items
      render :index, status: :unprocessable_entity
    end
  end

  def show
    @naillog = Naillog.find(params[:id])
    unless @naillog.status == "published" || @naillog.user == current_user
      redirect_to root_path, alert: "この投稿は公開されていません"
    end
  end

  def edit
    @naillog = current_user.naillogs.find(params[:id])
    load_nail_items
  end

  def update
    # ensure only owner can update (set_naillog uses current_user)
    if @naillog.update(naillog_params)
      @naillog.log_nails.destroy_all
      attach_nail_item!(@naillog)
      redirect_to @naillog, notice: "更新しました"
    else
      load_nail_items
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /naillogs/:id
  def destroy
    @naillog.destroy
    redirect_to naillogs_path, notice: "削除しました"
  end

  private

  def set_naillog
    # only allow owner to edit/update/destroy
    @naillog = current_user.naillogs.find(params[:id])
  end

  # Prepare @brands, (optionally) @products, @colors for new/edit render
  def load_nail_items
    @nail_items = NailItem.includes(:brand, :product, :prod_color)
                          .order(:brand_id, :product_id, :prod_color_id)
  end

  def naillog_params
    params.require(:naillog).permit(:title, :body, :nailed_date, :design_url, :status, :nail_shape, :main_image,
                                  log_nails_attributes: [ :id, :nail_item_id, :_destroy ])
  end
end
