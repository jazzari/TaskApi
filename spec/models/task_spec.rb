require 'rails_helper'

RSpec.describe Task, type: :model do
  describe "#Validations" do 
    let(:task) { build(:task) }
    
    it "should have valid factory" do 
      expect(task).to be_valid 
    end

    it "must have a title" do 
      task.title = ''
      expect(task).not_to be_valid 
      expect(task.errors[:title]).to include("can't be blank")
    end

    it "have an optional description" do 
      task.description = ''
      expect(task).to be_valid
    end

    it "have a completed boolean field" do 
      task.completed = ''
      expect(task).not_to be_valid 
    end
  end
end
