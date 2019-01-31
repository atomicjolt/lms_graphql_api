require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/sis_import"
module LMSGraphQL
  module Resolvers
    module Canvas
      class GetSisImportList < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::CanvasSisImport], null: false
        argument :get_all, Boolean, required: false
        argument :account_id, ID, required: true
        argument :created_since, LMSGraphQL::Types::DateTimeType, required: false
        argument :workflow_state, String, required: false
        def resolve(account_id:, created_since: nil, workflow_state: nil, get_all: false)
          result = context[:canvas_api].call("GET_SIS_IMPORT_LIST").proxy(
            "GET_SIS_IMPORT_LIST",
            {
              "account_id": account_id,
              "created_since": created_since,
              "workflow_state": workflow_state            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end