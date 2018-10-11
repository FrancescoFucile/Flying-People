class ReportsController < ApplicationController

  before_action :redirect_if_not_signed_in, only: [:new, :like, :dislike, :destroy]

  def index
    @reports = Report.all.order('created_at DESC')
  end

  def show
    @report = Report.find(params[:id])
  end

  def new
    @report = Report.new
  end

  def create
    @report = Report.new(report_params)
    if @report.save
      redirect_to report_path(:id => @report.id)
    else
      flash.now[:warning] = 'Locality not valid'
      render 'new'
    end
  end

  def destroy
    @report = Report.find(params[:id])
    Report.destroy(@report.id)
    flash[:success] = 'Report eliminato!'
    redirect_to root_path
  end

  def liked?(id)
    @report = Report.find(id)
    return current_user.report_likes.find_by(report_id: @report.id) != nil
  end
  helper_method :liked?

  def like
    @report = Report.find(params[:id])
    if @report.user.id == current_user.id
	      flash[:info] = 'Non puoi mettere like ai tuoi report'
    elsif liked? @report.id
        flash[:info] = 'Hai giá messo un like a questo report'
    else
        ReportLike.create(report_id: @report.id, user_id: current_user.id)
    end
    redirect_to reports_path
  end

  def dislike
    @report = Report.find(params[:id])
    if @report.user.id == current_user.id
	      flash[:info] = 'Non puoi eliminare un like ai tuoi report'
    elsif not liked? @report.id
        flash[:info] = 'Non hai ancore messo un like a questo report'
    else
        rid = ReportLike.find_by(report_id: @report.id, user_id: current_user.id).id
        ReportLike.destroy(rid)
    end
    redirect_to reports_path
  end

  def report_params
    params.require(:report).permit(:content, :title, :locality)
                         .merge(user_id: current_user.id)
  end

end
