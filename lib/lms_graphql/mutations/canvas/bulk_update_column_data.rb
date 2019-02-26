require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/progress"
module LMSGraphQL
  module Mutations
    module Canvas
      class BulkUpdateColumnDatum < BaseMutation
        argument :course_id, ID, required: true
        argument :column_data, [String], required: true
        field :progress, LMSGraphQL::Types::Canvas::CanvasProgress, null: false
        def resolve(course_id:, column_data:)
          context[:canvas_api].call("BULK_UPDATE_COLUMN_DATA").proxy(
            "BULK_UPDATE_COLUMN_DATA",
            {
              "course_id": course_id
            },
            {
              "column_data": column_data
            },
          ).parsed_response
        end
      end
    end
  end
end