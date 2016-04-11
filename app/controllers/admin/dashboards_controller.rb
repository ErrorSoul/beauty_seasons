class Admin::DashboardsController < Admin::BaseController
  def show
    @report = Report.new
  end

  def template
    send_file 'public/xlsx/example.xlsx', filename: 'template.xlsx'
  end
end
