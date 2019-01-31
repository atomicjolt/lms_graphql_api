require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/sis_import"
module LMSGraphQL
  module Resolvers
    module Canvas
      class GetCurrentImportingSisImport < CanvasBaseResolver
        type LMSGraphQL::Types::Canvas::CanvasSisImport, null: false
        argument :account_id, ID, required: true
        def resolve(account_id:, get_all: false)
          result = context[:canvas_api].call("GET_CURRENT_IMPORTING_SIS_IMPORT").proxy(
            "GET_CURRENT_IMPORTING_SIS_IMPORT",
            {
              "account_id": account_id            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end