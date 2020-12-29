require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/file"
module LMSGraphQL
  module Mutations
    module Canvas
      class ResetLinkVerifier < BaseMutation
        argument :id, ID, required: true
        
        
        field :file, LMSGraphQL::Types::Canvas::CanvasFile, null: false
        
        def resolve(id:)
          context[:canvas_api].call("RESET_LINK_VERIFIER").proxy(
            "RESET_LINK_VERIFIER",
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