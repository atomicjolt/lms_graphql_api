require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/migration_issue"
module LMSGraphQL
  module Mutations
    module Canvas
      class UpdateMigrationIssueGroup < BaseMutation
        argument :group_id, ID, required: true
        argument :content_migration_id, ID, required: true
        argument :id, ID, required: true
        argument :workflow_state, String, required: true
        
        
        field :migration_issue, LMSGraphQL::Types::Canvas::CanvasMigrationIssue, null: false
        
        def resolve(group_id:, content_migration_id:, id:, workflow_state:)
          context[:canvas_api].call("UPDATE_MIGRATION_ISSUE_GROUPS").proxy(
            "UPDATE_MIGRATION_ISSUE_GROUPS",
            {
              "group_id": group_id,
              "content_migration_id": content_migration_id,
              "id": id
            },
            {
              "workflow_state": workflow_state
            },
          ).parsed_response
        end
      end
    end
  end
end