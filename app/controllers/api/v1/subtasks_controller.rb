module Api
  module V1
    class SubtasksController < ApplicationController
      before_action :authenticate_user!, :set_task
      before_action :set_subtask, only: [:show, :update, :destroy]

      def index
        subtasks = @task.subtasks
        render json: SubtasksRepresenter.new(subtasks).as_json
      end

      def create
        subtask = @task.subtasks.new(subtask_params)
        if subtask.save
          render json: SubtaskRepresenter.new(subtask).as_json, status: :created
        else
          render json: subtask.errors, status: :unprocessable_entity
        end
      end
    
      def update
        subtask = Subtask.find(params[:id])
        subtask.update(subtask_params)
        render json: SubtaskRepresenter.new(subtask).as_json
      end
    
      def destroy
        subtask = Subtask.find(params[:id])
        subtask.destroy
        head :no_content, status: :ok
      end
    
      private
    
      def subtask_params
        params.require(:subtask).permit(:name, :completed, :task_id)
      end

      def set_task
        @task = Task.find(params[:task_id])
      end

      def set_subtask
        @subtask = @task.subtasks.find(params[:id]) if @task
      end
    end
  end
end