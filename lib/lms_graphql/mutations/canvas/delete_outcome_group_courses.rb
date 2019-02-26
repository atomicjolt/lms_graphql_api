require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/outcome_group"
module LMSGraphQL
  module Mutations
    module Canvas
      class DeleteOutcomeGroupCourse < BaseMutation
        argument :course_id, ID, required: true
        argument :id, ID, required: true
        field :outcome_group, LMSGraphQL::Types::Canvas::CanvasOutcomeGroup, null: false
        def resolve(course_id:, id:)
          context[:canvas_api].call("DELETE_OUTCOME_GROUP_COURSES").proxy(
            "DELETE_OUTCOME_GROUP_COURSES",
            {
              "course_id": course_id,
              "id": id
            },
            {},
          ).parsed_response
        end
      end
    end
  end
end