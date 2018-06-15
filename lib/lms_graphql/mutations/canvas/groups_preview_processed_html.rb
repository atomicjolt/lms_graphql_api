require_relative "../canvas_base_mutation"

module LMSGraphQL
  module Mutations
    module Canvas
      class GroupsPreviewProcessedHtml < CanvasBaseMutation
        argument :group_id, ID, required: true
        argument :html, String, required: false
        field :return_value, Boolean, null: false
        def resolve(group_id:, html: nil)
          context[:canvas_api].call("GROUPS_PREVIEW_PROCESSED_HTML").proxy(
            "GROUPS_PREVIEW_PROCESSED_HTML",
            {
              "group_id": group_id,
              "html": html            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end