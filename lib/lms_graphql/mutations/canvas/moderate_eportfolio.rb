require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/e_portfolio"
module LMSGraphQL
  module Mutations
    module Canvas
      class ModerateEportfolio < BaseMutation
        argument :eportfolio_id, ID, required: true
        argument :spam_status, String, required: false
        
        
        field :e_portfolio, LMSGraphQL::Types::Canvas::CanvasePortfolio, null: false
        
        def resolve(eportfolio_id:, spam_status: nil)
          context[:canvas_api].call("MODERATE_EPORTFOLIO").proxy(
            "MODERATE_EPORTFOLIO",
            {
              "eportfolio_id": eportfolio_id
            },
            {
              "spam_status": spam_status
            },
          ).parsed_response
        end
      end
    end
  end
end