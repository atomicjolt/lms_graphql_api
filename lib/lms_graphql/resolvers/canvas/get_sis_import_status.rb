require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/sis_import"
module LMSGraphQL
  module Resolvers
    module Canvas
      class GetSisImportStatus < CanvasBaseResolver
        type LMSGraphQL::Types::Canvas::CanvasSisImport, null: false
        argument :account_id, ID, required: true
        argument :id, ID, required: true
        def resolve(account_id:, id:, get_all: false)
          result = context[:canvas_api].call("GET_SIS_IMPORT_STATUS").proxy(
            "GET_SIS_IMPORT_STATUS",
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