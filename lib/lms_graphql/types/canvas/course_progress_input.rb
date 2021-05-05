require_relative "../canvas_base_input_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasCourseProgressInput < BaseInputObject
          description "Courses. API Docs: https://canvas.instructure.com/doc/api/courses.html"
      argument :requirement_count, Int, "total number of requirements from all modules.Example: 10", required: false
      argument :requirement_completed_count, Int, "total number of requirements the user has completed from all modules.Example: 1", required: false
      argument :next_requirement_url, String, "url to next module item that has an unmet requirement. null if the user has completed the course or the current module does not require sequential progress.Example: http://localhost/courses/1/modules/items/2", required: false
      argument :completed_at, LMSGraphQL::Types::DateTimeType, "date the course was completed. null if the course has not been completed by this user.Example: 2013-06-01T00:00:00-06:00", required: false

      end
    end
  end
end