require_relative "../canvas_base_input_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasCourseQuizExtensionInput < BaseInputObject
          description "Course Quiz Extensions. API Docs: https://canvas.instructure.com/doc/api/course_quiz_extensions.html"
        argument :user_id, ID, "The ID of the Student that needs the quiz extension..Example: 3", required: false
        argument :extra_attempts, Int, "Number of times the student is allowed to re-take the quiz over the multiple-attempt limit..Example: 1", required: false
        argument :extra_time, Int, "Amount of extra time allowed for the quiz submission, in minutes..Example: 60", required: false
        argument :manually_unlocked, Boolean, "The student can take the quiz even if it's locked for everyone else.Example: true", required: false
        argument :end_at, String, "The time at which the quiz submission will be overdue, and be flagged as a late submission..Example: 2013-11-07T13:16:18Z", required: false

      end
    end
  end
end