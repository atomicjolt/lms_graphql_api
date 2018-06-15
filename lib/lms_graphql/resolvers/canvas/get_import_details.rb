require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/change_record"
module LMSGraphQL
  module Resolvers
    module Canvas
      class GetImportDetail < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::CanvasChangeRecord], null: false
        argument :course_id, ID, required: true
        argument :subscription_id, ID, required: true
        argument :id, ID, required: true
        def resolve(course_id:, subscription_id:, id:)
          context[:canvas_api].call("GET_IMPORT_DETAILS").proxy(
            "GET_IMPORT_DETAILS",
            {
              "course_id": course_id,
              "subscription_id": subscription_id,
              "id": id            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end