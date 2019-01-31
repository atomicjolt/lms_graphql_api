require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/license"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ListLicensesGroup < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::CanvasLicense], null: false
        argument :get_all, Boolean, required: false
        argument :group_id, ID, required: true
        def resolve(group_id:, get_all: false)
          result = context[:canvas_api].call("LIST_LICENSES_GROUPS").proxy(
            "LIST_LICENSES_GROUPS",
            {
              "group_id": group_id            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end