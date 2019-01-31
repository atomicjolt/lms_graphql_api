require_relative "../canvas_base_resolver"

module LMSGraphQL
  module Resolvers
    module Canvas
      class LoadCustomDatum < CanvasBaseResolver
        type Boolean, null: false
        argument :user_id, ID, required: true
        argument :ns, String, required: true
        def resolve(user_id:, ns:, get_all: false)
          result = context[:canvas_api].call("LOAD_CUSTOM_DATA").proxy(
            "LOAD_CUSTOM_DATA",
            {
              "user_id": user_id,
              "ns": ns            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end