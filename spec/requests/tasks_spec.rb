require 'rails_helper'

RSpec.describe TasksController do 
  describe "#index" do 
    subject { get "/tasks" }
    let(:task) { create :task }

    it "should return success response" do 
      subject
      expect(response).to have_http_status(:ok)
    end

    it "should return proper json" do 
      task = create(:task)
      subject
      expect(json_data.length).to eq(1)
      first = json_data.first

      expect(first[:type]).to eq('task')
      expect(first[:attributes]).to eq(
        id: task.id,
        title: task.title,
        description: task.description,
        completed: task.completed
      )
    end
  end

  describe "#show" do 
    let(:task) { create :task }
    subject { get "/tasks/#{task.id}" }

    it "should return a success response" do 
      subject
      expect(response).to have_http_status(:ok)
    end

    it "should return proper json" do 
      subject

      expect(json_data[:type]).to eq('task')
      expect(json_data[:attributes]).to eq(
        id: task.id,
        title: task.title,
        description: task.description,
        completed: task.completed
      )
    end
  end

  describe "#create" do 
    subject { post "/tasks", params: {
        task: {
          title: "New task",
          description: "A new task",
          completed: false
        }
      } 
    }
    
    it "should return a success response" do 
      subject
      expect(response).to have_http_status(:created)
    end

    it "should return proper json" do 
      subject
      last = Task.last

      get "/tasks/#{last.id}" 
      #binding.pry
      expect(json_data[:type]).to eq('task')
      expect(json_data[:attributes]).to eq(
        id: last.id,
        title: last.title,
        description: last.description,
        completed: last.completed
      )
    end
  end

  describe "#update" do 
    let(:task) { create :task }
    subject { put "/tasks/#{task.id}", params: {
      task: {
        completed: true
        }
      } 
    }

    it "should return a success response" do 
      subject
      expect(response).to have_http_status(:ok)
    end
  end

  describe "#destroy" do 
    let(:task) { create :task }
    subject { delete "/tasks/#{task.id}" }

    it "should have 204 status code" do 
      subject
      expect(response).to have_http_status(:no_content)
    end

    it "should destroy the task" do 
      task
      expect{ subject }.to change{ Task.count }.by(-1)
    end
  end

end