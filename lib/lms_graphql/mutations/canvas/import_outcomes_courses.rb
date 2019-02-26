require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/outcome_import"
module LMSGraphQL
  module Mutations
    module Canvas
      class ImportOutcomesCourse < BaseMutation
        argument :course_id, ID, required: true
        argument :import_type, String, required: false
        argument :attachment, String, required: false
        argument :extension, String, required: false
        field :outcome_import, LMSGraphQL::Types::Canvas::CanvasOutcomeImport, null: false
        def resolve(course_id:, import_type: nil, attachment: nil, extension: nil)
          context[:canvas_api].call("IMPORT_OUTCOMES_COURSES").proxy(
            "IMPORT_OUTCOMES_COURSES",
            {
              "course_id": course_id
            },
            {
              "import_type": import_type,
              "attachment": attachment,
              "extension": extension
            },
          ).parsed_response
        end
      end
    end
  end
end