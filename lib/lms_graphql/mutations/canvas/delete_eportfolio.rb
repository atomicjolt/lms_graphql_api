require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/e_portfolio"
module LMSGraphQL
  module Mutations
    module Canvas
      class DeleteEportfolio < BaseMutation
        argument :id, ID, required: true
        
        
        field :e_portfolio, LMSGraphQL::Types::Canvas::CanvasePortfolio, null: false
        
        def resolve(id:)
          context[:canvas_api].call("DELETE_EPORTFOLIO").proxy(
            "DELETE_EPORTFOLIO",
            {
              "id": id
            },
            {},
          ).parsed_response
        end
      end
    end
  end
end