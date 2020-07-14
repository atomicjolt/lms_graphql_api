require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/rubric_assessment"
module LMSGraphQL
  module Mutations
    module Canvas
      class DeleteSingleRubricAssessment < BaseMutation
        argument :course_id, ID, required: true
        argument :rubric_association_id, ID, required: true
        argument :id, ID, required: true
        field :rubric_assessment, LMSGraphQL::Types::Canvas::CanvasRubricAssessment, null: false
        def resolve(course_id:, rubric_association_id:, id:)
          context[:canvas_api].call("DELETE_SINGLE_RUBRIC_ASSESSMENT").proxy(
            "DELETE_SINGLE_RUBRIC_ASSESSMENT",
            {
              "course_id": course_id,
              "rubric_association_id": rubric_association_id,
              "id": id
            },
            {},
          ).parsed_response
        end
      end
    end
  end
end