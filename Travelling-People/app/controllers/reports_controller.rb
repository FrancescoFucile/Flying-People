class ReportsController < ApplicationController

  before_action :redirect_if_not_signed_in, only: [:new]

  def index
    @reports = Report.all.order('created_at DESC')
  end

  def show
  end

  def new
    @report = Report.new
  end

  def create
    @report = Report.new(report_params)
    if @report.save
      redirect_to reports_path
    else
      redirect_to root_path
    end
  end

  def destroy
    @report = Report.find(params[:id])
    Report.destroy(@report.id)
    flash[:success] = 'Report eliminato!'
    redirect_to root_path
  end

  def like
    @report = Report.find(params[:id])
    if @report.user.id == current_user.id
	flash[:info] = 'Non puoi mettere like ai tuoi post'
    else
        @report.update(num_likes: @report.num_likes+1)
    end
    redirect_to reports_path
  end

  def report_params
    params.require(:report).permit(:content, :title)
                         .merge(user_id: current_user.id)
  end

end
