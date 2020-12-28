require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/custom_column"
module LMSGraphQL
  module Mutations
    module Canvas
      class UpdateCustomGradebookColumn < BaseMutation
        argument :course_id, ID, required: true
        argument :id, ID, required: true
        
        
        field :custom_column, LMSGraphQL::Types::Canvas::CanvasCustomColumn, null: false
        
        def resolve(course_id:, id:)
          context[:canvas_api].call("UPDATE_CUSTOM_GRADEBOOK_COLUMN").proxy(
            "UPDATE_CUSTOM_GRADEBOOK_COLUMN",
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