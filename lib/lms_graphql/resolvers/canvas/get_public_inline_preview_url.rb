require_relative "../canvas_base_resolver"

module LMSGraphQL
  module Resolvers
    module Canvas
      class GetPublicInlinePreviewUrl < CanvasBaseResolver
        type Boolean, null: false
        argument :id, ID, required: true
        argument :submission_id, ID, required: false
        def resolve(id:, submission_id: nil, get_all: false)
          result = context[:canvas_api].call("GET_PUBLIC_INLINE_PREVIEW_URL").proxy(
            "GET_PUBLIC_INLINE_PREVIEW_URL",
            {
              "id": id,
              "submission_id": submission_id            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end