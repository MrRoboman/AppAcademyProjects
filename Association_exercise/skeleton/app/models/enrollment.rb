class Enrollment < ActiveRecord::Base
  belongs_to(
    :course,
    :class_name => "Course",
    :foreign_key => :course_id,
    :primary_key => :id
  )
  belongs_to(
    :user,
    :class_name => "User",
    :foreign_key => :student_id,
    :primary_key => :id
  )
  # belongs_to (
  #   :course,
  #   :foreign_key => :course_id,
  #   :primary_key => :id,
  #   :class_name => :Course
  #   )
  #
  # belongs_to (
  #   :user,
  #   foreign_key: :user_id,
  #   primary_key: :id,
  #   class_name: :User
  #   )

end
