require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/migration_issue"
module LMSGraphQL
  module Resolvers
    module Canvas
      class GetMigrationIssueCourse < CanvasBaseResolver
        type LMSGraphQL::Types::Canvas::CanvasMigrationIssue, null: false
        argument :course_id, ID, required: true
        argument :content_migration_id, ID, required: true
        argument :id, ID, required: true
        def resolve(course_id:, content_migration_id:, id:, get_all: false)
          result = context[:canvas_api].call("GET_MIGRATION_ISSUE_COURSES").proxy(
            "GET_MIGRATION_ISSUE_COURSES",
            {
              "course_id": course_id,
              "content_migration_id": content_migration_id,
              "id": id            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end