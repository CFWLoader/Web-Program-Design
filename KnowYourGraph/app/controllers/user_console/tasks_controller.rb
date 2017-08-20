class UserConsole::TasksController < ApplicationController

  before_action :set_task, only: [:show]

  def index

    @tasks_list = TaskDetail.find_all_by_initiator_id session[:user]['id'], :order => :created_at.desc

  end

  def show

    @file_detail = GraphDataFile.find @task.file_id

  end

  private

  def set_task

    @task = TaskDetail.find params[:id]

  end

end
