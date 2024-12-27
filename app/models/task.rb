class Task < ApplicationRecord
    validates :title, presence: true
    validates :completed, inclusion: [true, false]
    validates :completed, exclusion: [nil]
end
