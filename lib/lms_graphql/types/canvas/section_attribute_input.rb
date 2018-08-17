require_relative "../canvas_base_input_type"
require_relative "course_attribute"
require_relative "course_attribute"
require_relative "section_assignment_override_attribute"

module LMSGraphQL
  module Types
    module Canvas
      class CanvasSectionAttributeInput < BaseInputObject
        description "SIS Integration. API Docs: https://canvas.instructure.com/doc/api/sis_integration.html"
        argument :id, ID, "The unique identifier for the section..Example: 1", required: false
        argument :name, String, "The name of the section..Example: Section A", required: false
        argument :sis_id, ID, "The sis id of the section..Example: s34643", required: false
        argument :integration_id, ID, "Optional: The integration ID of the section..Example: 3452342345", required: false
        argument :origin_course, LMSGraphQL::Types::Canvas::CanvasCourseAttribute, "The course to which the section belongs or the course from which the section was cross-listed.", required: false
        argument :xlist_course, LMSGraphQL::Types::Canvas::CanvasCourseAttribute, "Optional: Attributes of the xlist course. Only present when the section has been cross-listed. See Courses API for more details.", required: false
        argument :override, LMSGraphQL::Types::Canvas::CanvasSectionAssignmentOverrideAttribute, "Optional: Attributes of the assignment override that apply to the section. See Assignment API for more details.", required: false

      end
    end
  end
end