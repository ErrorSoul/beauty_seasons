class Admin::TasksController < Admin::BaseController

  def index
    @tasks = Task.all
  end

end
