require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/column_datum"
module LMSGraphQL
  module Mutations
    module Canvas
      class UpdateColumnDatum < BaseMutation
        argument :course_id, ID, required: true
        argument :id, ID, required: true
        argument :user_id, ID, required: true
        argument :column_data_content, String, required: true
        
        
        field :column_datum, LMSGraphQL::Types::Canvas::CanvasColumnDatum, null: false
        
        def resolve(course_id:, id:, user_id:, column_data_content:)
          context[:canvas_api].call("UPDATE_COLUMN_DATA").proxy(
            "UPDATE_COLUMN_DATA",
            {
              "course_id": course_id,
              "id": id,
              "user_id": user_id
            },
            {
              "column_data[content]": column_data_content
            },
          ).parsed_response
        end
      end
    end
  end
end