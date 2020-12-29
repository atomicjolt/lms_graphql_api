require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/shared_brand_config"
module LMSGraphQL
  module Mutations
    module Canvas
      class ShareBrandconfigTheme < BaseMutation
        argument :account_id, ID, required: true
        argument :shared_brand_config_name, String, required: true
        argument :shared_brand_config_brand_config_md5, String, required: true
        
        
        field :shared_brand_config, LMSGraphQL::Types::Canvas::CanvasSharedBrandConfig, null: false
        
        def resolve(account_id:, shared_brand_config_name:, shared_brand_config_brand_config_md5:)
          context[:canvas_api].call("SHARE_BRANDCONFIG_THEME").proxy(
            "SHARE_BRANDCONFIG_THEME",
            {
              "account_id": account_id
            },
            {
              "shared_brand_config[name]": shared_brand_config_name,
              "shared_brand_config[brand_config_md5]": shared_brand_config_brand_config_md5
            },
          ).parsed_response
        end
      end
    end
  end
end