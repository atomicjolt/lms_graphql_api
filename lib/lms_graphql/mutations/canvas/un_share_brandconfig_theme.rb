require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/shared_brand_config"
module LMSGraphQL
  module Mutations
    module Canvas
      class UnShareBrandconfigTheme < BaseMutation
        argument :id, ID, required: true
        field :shared_brand_config, LMSGraphQL::Types::Canvas::CanvasSharedBrandConfig, null: false
        def resolve(id:)
          context[:canvas_api].call("UN_SHARE_BRANDCONFIG_THEME").proxy(
            "UN_SHARE_BRANDCONFIG_THEME",
            {
              "id": id            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end