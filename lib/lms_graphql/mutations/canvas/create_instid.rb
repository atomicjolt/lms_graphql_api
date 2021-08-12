require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/inst_id"
module LMSGraphQL
  module Mutations
    module Canvas
      class CreateInstid < BaseMutation

        
        
        field :inst_id, LMSGraphQL::Types::Canvas::CanvasInstID, null: false
        
        def resolve()
          context[:canvas_api].call("CREATE_INSTID").proxy(
            "CREATE_INSTID",
            {},
            {},
          ).parsed_response
        end
      end
    end
  end
end