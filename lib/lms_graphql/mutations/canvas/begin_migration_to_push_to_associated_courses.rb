require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/blueprint_migration"
module LMSGraphQL
  module Mutations
    module Canvas
      class BeginMigrationToPushToAssociatedCourse < CanvasBaseMutation
        argument :course_id, ID, required: true
        argument :template_id, ID, required: true
        argument :comment, String, required: false
        argument :send_notification, Boolean, required: false
        argument :copy_settings, Boolean, required: false
        field :blueprint_migration, LMSGraphQL::Types::Canvas::CanvasBlueprintMigration, null: false
        def resolve(course_id:, template_id:, comment: nil, send_notification: nil, copy_settings: nil)
          context[:canvas_api].call("BEGIN_MIGRATION_TO_PUSH_TO_ASSOCIATED_COURSES").proxy(
            "BEGIN_MIGRATION_TO_PUSH_TO_ASSOCIATED_COURSES",
            {
              "course_id": course_id,
              "template_id": template_id,
              "comment": comment,
              "send_notification": send_notification,
              "copy_settings": copy_settings            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end