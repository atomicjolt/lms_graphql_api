require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/inst_access_token"
module LMSGraphQL
  module Mutations
    module Canvas
      class CreateInstaccessToken < BaseMutation

        
        
        field :inst_access_token, LMSGraphQL::Types::Canvas::CanvasInstAccessToken, null: false
        
        def resolve()
          context[:canvas_api].call("CREATE_INSTACCESS_TOKEN").proxy(
            "CREATE_INSTACCESS_TOKEN",
            {},
            {},
          ).parsed_response
        end
      end
    end
  end
end