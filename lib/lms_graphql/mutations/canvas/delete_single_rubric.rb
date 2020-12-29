require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/rubric"
module LMSGraphQL
  module Mutations
    module Canvas
      class DeleteSingleRubric < BaseMutation
        argument :course_id, ID, required: true
        argument :id, ID, required: true
        
        
        field :rubric, LMSGraphQL::Types::Canvas::CanvasRubric, null: false
        
        def resolve(course_id:, id:)
          context[:canvas_api].call("DELETE_SINGLE_RUBRIC").proxy(
            "DELETE_SINGLE_RUBRIC",
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