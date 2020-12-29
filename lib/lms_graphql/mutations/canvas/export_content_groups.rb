require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/content_export"
module LMSGraphQL
  module Mutations
    module Canvas
      class ExportContentGroup < BaseMutation
        argument :group_id, ID, required: true
        argument :export_type, String, required: true
        argument :skip_notifications, Boolean, required: false
        argument :select, String, required: false
        
        
        field :content_export, LMSGraphQL::Types::Canvas::CanvasContentExport, null: false
        
        def resolve(group_id:, export_type:, skip_notifications: nil, select: nil)
          context[:canvas_api].call("EXPORT_CONTENT_GROUPS").proxy(
            "EXPORT_CONTENT_GROUPS",
            {
              "group_id": group_id
            },
            {
              "export_type": export_type,
              "skip_notifications": skip_notifications,
              "select": select
            },
          ).parsed_response
        end
      end
    end
  end
end