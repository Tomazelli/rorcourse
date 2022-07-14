class Project < ApplicationRecord
    # Custom scopes
    # add defaults
    # integrate validations
    # integrate callbacks
    # integrating database relationships
    after_initialize :set_defaults
    validates_presence_of :title, :description, :percent_complete
    has_many :tasks

    scope :almost_completed, -> {where('percent_complete > 75.0') }
    scope :still_needs_some_work, -> {where('percent_complete < 75.0') }

    def set_defaults
        self.percent_complete ||= 0.0
    end
end