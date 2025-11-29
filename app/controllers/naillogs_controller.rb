class NaillogsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]

  def index
    @naillogs = Naillog.order(created_at: :desc)
  end

  def new
    @naillog = Naillog.new
  end

  def create
    @naillog = current_user.naillogs.new(naillog_params)
    # 送信ボタンで status を設定
    @naillog.status = (params[:commit] == "下書き") ? "draft" : "published"
    if @naillog.save
      redirect_to naillogs_path, notice: "Nail Logを投稿しました"
    else
      render :new, status: :unprocessable_entity
    end
  end

private

  def naillog_params
    params.require(:naillog).permit(:title, :body, :nailed_date, :design_url, :status, :nail_shape)
  end

end
