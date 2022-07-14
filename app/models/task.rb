class Task < ApplicationRecord
  belongs_to :project
  after_initialize :set_defaults

  after_save :update_percent_complete if :mark_completed?

  scope :completed, -> {where(completed: true)}

  mount_uploader :task_file, TaskFileUploader

  def mark_completed?
    self.completed == true
  end

  def update_percent_complete
    project = Project.find(self.project_id)
    count_of_completed_tasks = project.tasks.completed.count
    count_of_total_tasks = project.tasks.count
    project.update!(percent_complete: Counter.calculate_percent_complete(count_of_completed_tasks, count_of_total_tasks))
  end

  def set_defaults
    self.completed ||= false
  end
end