require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/progress"
module LMSGraphQL
  module Mutations
    module Canvas
      class ImportCategoryGroup < BaseMutation
        argument :group_category_id, ID, required: true
        argument :attachment, String, required: false
        field :progress, LMSGraphQL::Types::Canvas::CanvasProgress, null: false
        def resolve(group_category_id:, attachment: nil)
          context[:canvas_api].call("IMPORT_CATEGORY_GROUPS").proxy(
            "IMPORT_CATEGORY_GROUPS",
            {
              "group_category_id": group_category_id
            },
            {
              "attachment": attachment
            },
          ).parsed_response
        end
      end
    end
  end
end