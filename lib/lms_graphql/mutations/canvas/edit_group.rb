require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/group"
module LMSGraphQL
  module Mutations
    module Canvas
      class EditGroup < BaseMutation
        argument :group_id, ID, required: true
        argument :name, String, required: false
        argument :description, String, required: false
        argument :is_public, Boolean, required: false
        argument :join_level, String, required: false
        argument :avatar_id, ID, required: false
        argument :storage_quota_mb, Int, required: false
        argument :members, String, required: false
        argument :sis_group_id, ID, required: false
        field :group, LMSGraphQL::Types::Canvas::CanvasGroup, null: false
        def resolve(group_id:, name: nil, description: nil, is_public: nil, join_level: nil, avatar_id: nil, storage_quota_mb: nil, members: nil, sis_group_id: nil)
          context[:canvas_api].call("EDIT_GROUP").proxy(
            "EDIT_GROUP",
            {
              "group_id": group_id,
              "name": name,
              "description": description,
              "is_public": is_public,
              "join_level": join_level,
              "avatar_id": avatar_id,
              "storage_quota_mb": storage_quota_mb,
              "members": members,
              "sis_group_id": sis_group_id            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end