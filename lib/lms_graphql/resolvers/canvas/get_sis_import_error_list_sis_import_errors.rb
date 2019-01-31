require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/sis_import_error"
module LMSGraphQL
  module Resolvers
    module Canvas
      class GetSisImportErrorListSisImportError < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::CanvasSisImportError], null: false
        argument :get_all, Boolean, required: false
        argument :account_id, ID, required: true
        argument :failure, Boolean, required: false
        def resolve(account_id:, failure: nil, get_all: false)
          result = context[:canvas_api].call("GET_SIS_IMPORT_ERROR_LIST_SIS_IMPORT_ERRORS").proxy(
            "GET_SIS_IMPORT_ERROR_LIST_SIS_IMPORT_ERRORS",
            {
              "account_id": account_id,
              "failure": failure            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end