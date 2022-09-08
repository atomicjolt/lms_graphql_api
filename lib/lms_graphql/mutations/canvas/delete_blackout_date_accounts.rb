require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/blackout_date"
module LMSGraphQL
  module Mutations
    module Canvas
      class DeleteBlackoutDateAccount < BaseMutation
        argument :account_id, ID, required: true
        argument :id, ID, required: true
        
        
        field :blackout_date, LMSGraphQL::Types::Canvas::CanvasBlackoutDate, null: false
        
        def resolve(account_id:, id:)
          context[:canvas_api].call("DELETE_BLACKOUT_DATE_ACCOUNTS").proxy(
            "DELETE_BLACKOUT_DATE_ACCOUNTS",
            {
              "account_id": account_id,
              "id": id
            },
            {},
          ).parsed_response
        end
      end
    end
  end
end