require_relative "../canvas_base_input_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasSectionInput < BaseInputObject
          description "Sections. API Docs: https://canvas.instructure.com/doc/api/sections.html"
        argument :id, ID, "The unique identifier for the section..Example: 1", required: false
        argument :name, String, "The name of the section..Example: Section A", required: false
        argument :sis_section_id, ID, "The sis id of the section. This field is only included if the user has permission to view SIS information..Example: s34643", required: false
        argument :integration_id, ID, "Optional: The integration ID of the section. This field is only included if the user has permission to view SIS information..Example: 3452342345", required: false
        argument :sis_import_id, ID, "The unique identifier for the SIS import if created through SIS. This field is only included if the user has permission to manage SIS information..Example: 47", required: false
        argument :course_id, ID, "The unique Canvas identifier for the course in which the section belongs.Example: 7", required: false
        argument :sis_course_id, ID, "The unique SIS identifier for the course in which the section belongs. This field is only included if the user has permission to view SIS information..Example: 7", required: false
        argument :start_at, GraphQL::Types::ISO8601DateTime, "the start date for the section, if applicable.Example: 2012-06-01T00:00:00-06:00", required: false
        argument :end_at, GraphQL::Types::ISO8601DateTime, "the end date for the section, if applicable.", required: false
        argument :restrict_enrollments_to_section_dates, Boolean, "Restrict user enrollments to the start and end dates of the section.", required: false
        argument :nonxlist_course_id, ID, "The unique identifier of the original course of a cross-listed section.", required: false
        argument :total_students, Int, "optional: the total number of active and invited students in the section.Example: 13", required: false

      end
    end
  end
end