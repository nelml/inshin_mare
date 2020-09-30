class NoticesController < ApplicationController
  def index
    @notices = Notice.all.order(created_at: :desc)
  end

  def edit
  end

  def new
    @notice = Notice.new
  end

  def update
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
  end

  private
  def notice_params
    params.require(:notice).permit(:introduction)
  end

end
