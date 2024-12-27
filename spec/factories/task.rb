FactoryBot.define do
    factory :task do
      sequence(:title) {|n| "Task #{n}" }
      sequence(:description) {|n| "This is task number #{n}" }
      completed { false }
    end
  end