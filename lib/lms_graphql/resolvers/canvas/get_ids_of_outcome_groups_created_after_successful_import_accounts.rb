require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/array_of_outcome_id"
module LMSGraphQL
  module Resolvers
    module Canvas
      class GetIdsOfOutcomeGroupsCreatedAfterSuccessfulImportAccount < CanvasBaseResolver
        type LMSGraphQL::Types::Canvas::Canvasarray_of_outcome_id, null: false
        argument :account_id, ID, required: true
        argument :id, ID, required: true
        def resolve(account_id:, id:, get_all: false)
          result = context[:canvas_api].call("GET_IDS_OF_OUTCOME_GROUPS_CREATED_AFTER_SUCCESSFUL_IMPORT_ACCOUNTS").proxy(
            "GET_IDS_OF_OUTCOME_GROUPS_CREATED_AFTER_SUCCESSFUL_IMPORT_ACCOUNTS",
            {
              "account_id": account_id,
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