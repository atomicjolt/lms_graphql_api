require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/content_export"
module LMSGraphQL
  module Mutations
    module Canvas
      class ExportContentCourse < BaseMutation
        argument :course_id, ID, required: true
        argument :export_type, String, required: true
        argument :skip_notifications, Boolean, required: false
        argument :select, String, required: false
        
        
        field :content_export, LMSGraphQL::Types::Canvas::CanvasContentExport, null: false
        
        def resolve(course_id:, export_type:, skip_notifications: nil, select: nil)
          context[:canvas_api].call("EXPORT_CONTENT_COURSES").proxy(
            "EXPORT_CONTENT_COURSES",
            {
              "course_id": course_id
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