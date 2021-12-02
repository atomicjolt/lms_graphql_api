require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/e_portfolio"
module LMSGraphQL
  module Mutations
    module Canvas
      class RestoreDeletedEportfolio < BaseMutation
        argument :eportfolio_id, ID, required: true
        
        
        field :e_portfolio, LMSGraphQL::Types::Canvas::CanvasePortfolio, null: false
        
        def resolve(eportfolio_id:)
          context[:canvas_api].call("RESTORE_DELETED_EPORTFOLIO").proxy(
            "RESTORE_DELETED_EPORTFOLIO",
            {
              "eportfolio_id": eportfolio_id
            },
            {},
          ).parsed_response
        end
      end
    end
  end
end