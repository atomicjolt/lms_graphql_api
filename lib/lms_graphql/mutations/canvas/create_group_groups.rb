require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/group"
module LMSGraphQL
  module Mutations
    module Canvas
      class CreateGroupGroup < BaseMutation
        argument :name, String, required: false
        argument :description, String, required: false
        argument :is_public, Boolean, required: false
        argument :join_level, String, required: false
        argument :storage_quota_mb, Int, required: false
        argument :sis_group_id, ID, required: false
        field :group, LMSGraphQL::Types::Canvas::CanvasGroup, null: false
        def resolve(name: nil, description: nil, is_public: nil, join_level: nil, storage_quota_mb: nil, sis_group_id: nil)
          context[:canvas_api].call("CREATE_GROUP_GROUPS").proxy(
            "CREATE_GROUP_GROUPS",
            {
              "name": name,
              "description": description,
              "is_public": is_public,
              "join_level": join_level,
              "storage_quota_mb": storage_quota_mb,
              "sis_group_id": sis_group_id            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end