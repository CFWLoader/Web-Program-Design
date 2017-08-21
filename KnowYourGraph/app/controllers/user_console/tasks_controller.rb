class UserConsole::TasksController < ApplicationController

  before_action :set_task, only: [:show]

  def index

    @tasks_list = TaskDetail.find_all_by_initiator_id session[:user]['id'], :order => :created_at.desc

  end

  def show

    @file_detail = GraphDataFile.find @task.file_id

  end

  def refresh_state

    @task = TaskDetail.find_by_id params[:id]

    @task.task_state = 'Test Tag'

    @task.save

    # TaskDetail.find_and_modify :query => {'_id': @task._id}, :update => {'$set': {'task_state': @task.task_state}}

    redirect_to '/user_console/tasks/index'

  end

  private

  def set_task

    @task = TaskDetail.find params[:id]

  end

end
