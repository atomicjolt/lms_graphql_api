require_relative "../canvas_base_input_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasTurnitinSettingInput < BaseInputObject
        description "Assignments. API Docs: https://canvas.instructure.com/doc/api/assignments.html"
      argument :originality_report_visibility, String, "Example: after_grading", required: false
      argument :s_paper_check, Boolean, "", required: false
      argument :internet_check, Boolean, "", required: false
      argument :journal_check, Boolean, "", required: false
      argument :exclude_biblio, Boolean, "", required: false
      argument :exclude_quoted, Boolean, "", required: false
      argument :exclude_small_matches_type, String, "Example: percent", required: false
      argument :exclude_small_matches_value, Int, "Example: 50", required: false

      end
    end
  end
end