class TasksController < ApplicationController
    before_action :set_task, only: [:show, :update, :destroy]

    #GET /api/v1/tasks
    def index
        @tasks = Task.all 
        if @tasks.empty?
            render json:("There are no more tasks to show")
        else
            render json: serializer.new(@tasks), status: :ok
        end
    end

    #GET /api/v1/tasks/1
    def show
        render json: serializer.new(@task), status: :ok
        rescue ActiveRecord::RecordNotFound => e  
            render json: { message: e.message }, status: :not_found
    end

    #POST /api/v1/tasks
    def create
        @task = Task.new(task_params)
        if @task.save
            render json: @task, status: :created 
        else 
            render json: @task.errors, status: :unprocessable_entity 
        end
    end

    #PUT /api/v1/tasks/1
    def update
        if @task.update(task_params)
            render json: serializer.new(@task), status: :ok
        else
            render json: @task.errors, status: :unprocessable_entity 
        end
    end

    #DELETE /api/v1/tasks/1
    def destroy
        @task.destroy
        head :no_content
    end


    private
    def set_task
       @task = Task.find(params[:id]) 
    end

    def task_params
        params.require(:task).permit(:title, :description, :completed)
    end

    def serializer
        TaskSerializer
    end
end
