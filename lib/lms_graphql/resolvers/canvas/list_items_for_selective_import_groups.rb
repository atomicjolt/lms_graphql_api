require_relative "../canvas_base_resolver"

module LMSGraphQL
  module Resolvers
    module Canvas
      class ListItemsForSelectiveImportGroup < CanvasBaseResolver
        type [String], null: false
        argument :group_id, ID, required: true
        argument :id, ID, required: true
        argument :type, String, required: false
        def resolve(group_id:, id:, type: nil, get_all: false)
          result = context[:canvas_api].call("LIST_ITEMS_FOR_SELECTIVE_IMPORT_GROUPS").proxy(
            "LIST_ITEMS_FOR_SELECTIVE_IMPORT_GROUPS",
            {
              "group_id": group_id,
              "id": id,
              "type": type            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end