class MypagesController < ApplicationController
  def show
    @user = current_user
    @item_sku = current_user.nail_stocks
                            .joins(:nail_item)
                            .includes(
                                  nail_item: [
                                    :brand, :product, :prod_color
                                   ]
                                  )
                            .order(:brand_id, :product_id, :prod_color_id)
    @naillogs = current_user.naillogs.order(created_at: :desc).limit(5)
  end

  def edit
  end

  def update
  end

  private

  def user_params
    params.require(:mypage).permit(:nickname, :age_group, :gender, :started_nail_on)
  end

  def nail_item_params
    params.require(:mypage).permit(:brand_name, :product_name, :prod_color_name)
  end
end
