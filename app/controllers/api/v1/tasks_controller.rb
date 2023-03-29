require 'net/http'

module Api
  module V1
    class TasksController < ApplicationController
      before_action :authenticate_user!

      def index
        tasks = current_user.Task.order("completed ASC, created_at DESC")
        render json: TasksRepresenter.new(tasks).as_json
      end

      def show
        task = task.find(params[:id])
        render json: TaskRepresenter.new(tasks).as_json
      end

      def create
        task = current_user.tasks.new(task_params)

        if task.save
          render json: TaskRepresenter.new(task).as_json, status: :created
        else
          render json: task.errors, status: :unprocessable_entity
        end
      end

      def update
        task = Task.find(params[:id])
        task.update(task_params)
        render json: TaskRepresenter.new(task).as_json
      end

      def destroy
        task = Task.find(params[:id])
        task.destroy
        head :no_content, status: :ok
      end

      private

      def task_params
        params.require(:task).permit(:name ,:completed)
      end
    end
  end
end
