require_relative "../canvas_base_input_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasSharedBrandConfigInput < BaseInputObject
          description "Shared Brand Configs. API Docs: https://canvas.instructure.com/doc/api/shared_brand_configs.html"
        argument :id, ID, "The shared_brand_config identifier..Example: 987", required: false
        argument :account_id, ID, "The id of the account it should be shared within..", required: false
        argument :brand_config_md5, String, "The md5 (since BrandConfigs are identified by MD5 and not numeric id) of the BrandConfig to share..Example: 1d31002c95842f8fe16da7dfcc0d1f39", required: false
        argument :name, String, "The name to share this theme as.Example: Crimson and Gold Verson 1", required: false
        argument :created_at, GraphQL::Types::ISO8601DateTime, "When this was created.Example: 2012-07-13T10:55:20-06:00", required: false
        argument :updated_at, GraphQL::Types::ISO8601DateTime, "When this was last updated.Example: 2012-07-13T10:55:20-06:00", required: false

      end
    end
  end
end