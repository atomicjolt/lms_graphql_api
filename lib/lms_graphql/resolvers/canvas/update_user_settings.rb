require_relative "../canvas_base_resolver"

module LMSGraphQL
  module Resolvers
    module Canvas
      class UpdateUserSetting < CanvasBaseResolver
        type Boolean, null: false
        argument :id, ID, required: true
        argument :manual_mark_as_read, Boolean, required: false
        argument :collapse_global_nav, Boolean, required: false
        def resolve(id:, manual_mark_as_read: nil, collapse_global_nav: nil, get_all: false)
          result = context[:canvas_api].call("UPDATE_USER_SETTINGS").proxy(
            "UPDATE_USER_SETTINGS",
            {
              "id": id,
              "manual_mark_as_read": manual_mark_as_read,
              "collapse_global_nav": collapse_global_nav            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end