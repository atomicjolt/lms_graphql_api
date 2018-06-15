require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/sis_import"
module LMSGraphQL
  module Resolvers
    module Canvas
      class GetSisImportList < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::CanvasSisImport], null: false
        argument :account_id, ID, required: true
        argument :created_since, LMSGraphQL::Types::DateTimeType, required: false
        def resolve(account_id:, created_since: nil)
          context[:canvas_api].call("GET_SIS_IMPORT_LIST").proxy(
            "GET_SIS_IMPORT_LIST",
            {
              "account_id": account_id,
              "created_since": created_since            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end