class NoticesController < ApplicationController
  before_action :authenticate_admin!, only:[:new, :edit, :create, :destroy]

  def index
    @notices = Notice.all.order(created_at: :desc)
  end

  def edit
    @notice = Notice.find(params[:id])
  end

  def new
    @notice = Notice.new
    @notices = Notice.all.order(created_at: :desc)
  end

  def update
    notice = Notice.find(params[:id])
    if notice.update(notice_params)
      redirect_to new_notice_path, notice: "お知らせの更新に成功しました"
    else
      render action: :edit
    end
  end

  def create
    notice = Notice.new(notice_params)
    if notice.save
      redirect_to notices_path, notice: '新規お知らせの投稿が完了しました。'
    else
      render action: :new
    end
  end

  def destroy
    notice = Notice.find(params[:id])
    notice.destroy
    redirect_to new_notice_path, notice: "削除に成功しました！"
  end

  private
  def notice_params
    params.require(:notice).permit(:introduction)
  end

end
