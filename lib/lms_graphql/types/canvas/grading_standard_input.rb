require_relative "../canvas_base_input_type"
require_relative "grading_scheme_entry"

module LMSGraphQL
  module Types
    module Canvas
      class CanvasGradingStandardInput < BaseInputObject
        description "Grading Standards. API Docs: https://canvas.instructure.com/doc/api/grading_standards.html"
        argument :title, String, "the title of the grading standard.Example: Account Standard", required: false
        argument :id, ID, "the id of the grading standard.Example: 1", required: false
        argument :context_type, String, "the context this standard is associated with, either 'Account' or 'Course'.Example: Account", required: false
        argument :context_id, ID, "the id for the context either the Account or Course id.Example: 1", required: false
        argument :grading_scheme, [LMSGraphQL::Types::Canvas::CanvasGradingSchemeEntry], "A list of GradingSchemeEntry that make up the Grading Standard as an array of values with the scheme name and value.Example: {'name'=>'A', 'value'=>0.9}, {'name'=>'B', 'value'=>0.8}, {'name'=>'C', 'value'=>0.7}, {'name'=>'D', 'value'=>0.6}", required: false

      end
    end
  end
end