require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/rubric_association"
module LMSGraphQL
  module Mutations
    module Canvas
      class DeleteRubricassociation < BaseMutation
        argument :course_id, ID, required: true
        argument :id, ID, required: true
        field :rubric_association, LMSGraphQL::Types::Canvas::CanvasRubricAssociation, null: false
        def resolve(course_id:, id:)
          context[:canvas_api].call("DELETE_RUBRICASSOCIATION").proxy(
            "DELETE_RUBRICASSOCIATION",
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