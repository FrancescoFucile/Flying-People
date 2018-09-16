class ReportsController < ApplicationController

  before_action :redirect_if_not_signed_in, only: [:new]

  def index
    @reports = Report.all
  end

  def show
  end

  def new
    @report = Report.new
  end

  def create
    @report = Report.new(report_params)
    if @report.save
      redirect_to user_path(current_user)
    else
      redirect_to root_path
    end
  end

  def report_params
    params.require(:report).permit(:content, :title)
                         .merge(user_id: current_user.id)
  end

end
