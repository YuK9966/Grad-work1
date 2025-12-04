class NaillogsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create edit]

  def index
    @naillogs = Naillog.order(created_at: :desc)
  end

  def new
    @naillog = Naillog.new
  end

  def create
    @naillog = current_user.naillogs.new(naillog_params)
    # formのボタンでstatusを設定
    @naillog.status = (params[:commit] == "下書き") ? "draft" : "published"
    if @naillog.save
      if @naillog.status == "draft"
        redirect_to edit_naillog_path(@naillog), notice: "Nail Logを下書き保存しました"
      else
        redirect_to naillogs_path, notice: "Nail Logを投稿しました"
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @naillog = current_user.naillogs.find(params[:id])
  end

private

  def naillog_params
    params.require(:naillog).permit(:title, :body, :nailed_date, :design_url, :status, :nail_shape, :main_image)
  end
end
