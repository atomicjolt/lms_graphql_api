require_relative "../canvas_base_input_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasCourseNicknameInput < BaseInputObject
        description "Users. API Docs: https://canvas.instructure.com/doc/api/users.html"
      argument :course_id, ID, "the ID of the course.Example: 88", required: false
      argument :name, String, "the actual name of the course.Example: S1048576 DPMS1200 Intro to Newtonian Mechanics", required: false
      argument :nickname, String, "the calling user's nickname for the course.Example: Physics", required: false

      end
    end
  end
end