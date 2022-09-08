require_relative "../canvas_base_resolver"

module LMSGraphQL
  module Resolvers
    module Canvas
      class GetIdsOfOutcomeGroupsCreatedAfterSuccessfulImportCourse < CanvasBaseResolver
        type [String], null: false
        argument :course_id, ID, required: true
        argument :id, ID, required: true
        def resolve(course_id:, id:, get_all: false)
          result = context[:canvas_api].call("GET_IDS_OF_OUTCOME_GROUPS_CREATED_AFTER_SUCCESSFUL_IMPORT_COURSES").proxy(
            "GET_IDS_OF_OUTCOME_GROUPS_CREATED_AFTER_SUCCESSFUL_IMPORT_COURSES",
            {
              "course_id": course_id,
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