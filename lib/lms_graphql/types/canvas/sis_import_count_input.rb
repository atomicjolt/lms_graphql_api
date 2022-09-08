require_relative "../canvas_base_input_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasSisImportCountInput < BaseInputObject
          description "SIS Imports. API Docs: https://canvas.instructure.com/doc/api/sis_imports.html"
        argument :accounts, Int, "Example: 0", required: false
        argument :terms, Int, "Example: 3", required: false
        argument :abstract_courses, Int, "Example: 0", required: false
        argument :courses, Int, "Example: 121", required: false
        argument :sections, Int, "Example: 278", required: false
        argument :xlists, Int, "Example: 0", required: false
        argument :users, Int, "Example: 346", required: false
        argument :enrollments, Int, "Example: 1542", required: false
        argument :groups, Int, "Example: 0", required: false
        argument :group_memberships, Int, "Example: 0", required: false
        argument :grade_publishing_results, Int, "Example: 0", required: false
        argument :batch_courses_deleted, Int, "the number of courses that were removed because they were not included in the batch for batch_mode imports. Only included if courses were deleted.Example: 11", required: false
        argument :batch_sections_deleted, Int, "the number of sections that were removed because they were not included in the batch for batch_mode imports. Only included if sections were deleted.Example: 0", required: false
        argument :batch_enrollments_deleted, Int, "the number of enrollments that were removed because they were not included in the batch for batch_mode imports. Only included if enrollments were deleted.Example: 150", required: false
        argument :error_count, Int, "Example: 0", required: false
        argument :warning_count, Int, "Example: 0", required: false

      end
    end
  end
end