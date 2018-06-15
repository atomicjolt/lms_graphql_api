require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/license"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ListLicensesGroup < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::License], null: false
        argument :group_id, ID, required: true
        def resolve(group_id:)
          context[:canvas_api].proxy(
            "LIST_LICENSES_GROUPS",
            {
              "group_id": group_id            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end