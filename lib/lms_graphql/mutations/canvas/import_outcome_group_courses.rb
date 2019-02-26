require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/outcome_group"
module LMSGraphQL
  module Mutations
    module Canvas
      class ImportOutcomeGroupCourse < BaseMutation
        argument :course_id, ID, required: true
        argument :id, ID, required: true
        argument :source_outcome_group_id, ID, required: true
        argument :async, Boolean, required: false
        field :outcome_group, LMSGraphQL::Types::Canvas::CanvasOutcomeGroup, null: false
        def resolve(course_id:, id:, source_outcome_group_id:, async: nil)
          context[:canvas_api].call("IMPORT_OUTCOME_GROUP_COURSES").proxy(
            "IMPORT_OUTCOME_GROUP_COURSES",
            {
              "course_id": course_id,
              "id": id
            },
            {
              "source_outcome_group_id": source_outcome_group_id,
              "async": async
            },
          ).parsed_response
        end
      end
    end
  end
end