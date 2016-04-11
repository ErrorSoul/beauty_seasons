class Admin::ReportsController < Admin::BaseController

  def create
    Report.destroy_all
    @report = Report.new report_params
    if @report.save and create_tasks
      flash[:success] = t 'flash.reports.success.created'
      redirect_to admin_tasks_path
    else
      flash[:warning] = t 'flash.reports.fail.created'
      redirect_to admin_dashboard_url
    end
  end



  private

  def create_tasks
    rows = BatchFactory.from_file @report.filename
    Task.transaction do
      rows.rows.each do |row|
        @report.tasks.create!(
          fio: row["ФИО"],
          phone: row["Тел"].to_s.scan(/\d+/).join,
          email: row["Почта"],
          link: row["Ссылка"]
        )
      end
    end
    @report.update_attribute(:current_id, @report.tasks.first.id)
    true
  rescue => e
    puts e
    false
  end

  def report_params
    params[:report].permit(:name, :asset)
  end
end
