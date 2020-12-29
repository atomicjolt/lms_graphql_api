require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/shared_brand_config"
module LMSGraphQL
  module Mutations
    module Canvas
      class UpdateSharedTheme < BaseMutation
        argument :account_id, ID, required: true
        argument :id, ID, required: true
        
        
        field :shared_brand_config, LMSGraphQL::Types::Canvas::CanvasSharedBrandConfig, null: false
        
        def resolve(account_id:, id:)
          context[:canvas_api].call("UPDATE_SHARED_THEME").proxy(
            "UPDATE_SHARED_THEME",
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