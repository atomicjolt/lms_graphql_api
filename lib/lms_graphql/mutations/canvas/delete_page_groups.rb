require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/page"
module LMSGraphQL
  module Mutations
    module Canvas
      class DeletePageGroup < BaseMutation
        argument :group_id, ID, required: true
        argument :url_or_id, ID, required: true
        
        
        field :page, LMSGraphQL::Types::Canvas::CanvasPage, null: false
        
        def resolve(group_id:, url_or_id:)
          context[:canvas_api].call("DELETE_PAGE_GROUPS").proxy(
            "DELETE_PAGE_GROUPS",
            {
              "group_id": group_id,
              "url_or_id": url_or_id
            },
            {},
          ).parsed_response
        end
      end
    end
  end
end