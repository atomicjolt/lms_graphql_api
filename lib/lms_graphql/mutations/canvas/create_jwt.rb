require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/jwt"
module LMSGraphQL
  module Mutations
    module Canvas
      class CreateJwt < BaseMutation
        argument :workflows, [String], required: false
        argument :context_type, String, required: false
        argument :context_id, ID, required: false
        argument :context_uuid, String, required: false
        
        
        field :jwt, LMSGraphQL::Types::Canvas::CanvasJWT, null: false
        
        def resolve(workflows: nil, context_type: nil, context_id: nil, context_uuid: nil)
          context[:canvas_api].call("CREATE_JWT").proxy(
            "CREATE_JWT",
            {},
            {
              "workflows": workflows,
              "context_type": context_type,
              "context_id": context_id,
              "context_uuid": context_uuid
            },
          ).parsed_response
        end
      end
    end
  end
end