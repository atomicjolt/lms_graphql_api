require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/assignment"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ListMissingSubmission < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::Assignment], null: false
        argument :user_id, ID, required: true
        argument :include, String, required: false
        def resolve(user_id:, include: nil)
          context[:canvas_api].proxy(
            "LIST_MISSING_SUBMISSIONS",
            {
              "user_id": user_id,
              "include": include            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end