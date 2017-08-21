class UserConsole::TasksController < ApplicationController

  before_action :set_task, only: [:show]

  def index

    @tasks_list = TaskDetail.order_by(created_at: :desc).where(initiator_id: session[:user]['_id']['$oid'])

  end

  def show

    @file_detail = GraphDataFile.find @task.file_id

  end

  def refresh_state

    # @task = TaskDetail.find_by_id params[:id]
    #
    # @task.task_state = 'Test Tag'
    #
    # @task.save

    redirect_to '/user_console/tasks/index'

  end

  private

  def set_task

    @task = TaskDetail.find params[:id]

  end

end
