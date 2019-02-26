require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/report"
module LMSGraphQL
  module Mutations
    module Canvas
      class DeleteReport < BaseMutation
        argument :account_id, ID, required: true
        argument :report, String, required: true
        argument :id, ID, required: true
        field :report, LMSGraphQL::Types::Canvas::CanvasReport, null: false
        def resolve(account_id:, report:, id:)
          context[:canvas_api].call("DELETE_REPORT").proxy(
            "DELETE_REPORT",
            {
              "account_id": account_id,
              "report": report,
              "id": id
            },
            {},
          ).parsed_response
        end
      end
    end
  end
end