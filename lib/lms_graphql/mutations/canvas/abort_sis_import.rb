require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/sis_import"
module LMSGraphQL
  module Mutations
    module Canvas
      class AbortSisImport < BaseMutation
        argument :account_id, ID, required: true
        argument :id, ID, required: true
        field :sis_import, LMSGraphQL::Types::Canvas::CanvasSisImport, null: false
        def resolve(account_id:, id:)
          context[:canvas_api].call("ABORT_SIS_IMPORT").proxy(
            "ABORT_SIS_IMPORT",
            {
              "account_id": account_id,
              "id": id            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end