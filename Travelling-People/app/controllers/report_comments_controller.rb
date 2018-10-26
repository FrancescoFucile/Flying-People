class ReportCommentsController < ApplicationController

  before_action :redirect_if_not_signed_in, only: [:new, :destroy]

  def index
    report = Report.find(params[:report_id])
    @report_comments = report.report_comments
  end

  def show
    report = Report.find(params[:report_id])
    @report_comments = report.report_comments
  end

  def new
    @report_comment = ReportComment.new
  end

  def create
    @report = Report.find(params[:report_id])
    @report_comment = @report.report_comments.create(report_comment_params)
    redirect_to report_path(@report)
  end
 
  def destroy
    @report_comment = ReportComment.find(params[:id])
    ReportComment.destroy(@report.id)
    flash[:success] = 'Commento eliminato!'
    redirect_to report_path(@report_comment.report)
  end

  def report_comment_params
    params.require(:report_comment).permit(:content)
            .merge(user_id: current_user.id)
  end

end