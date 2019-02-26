require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/progress"
module LMSGraphQL
  module Mutations
    module Canvas
      class RestoreWorkflowStatesOfSisImportedItem < BaseMutation
        argument :account_id, ID, required: true
        argument :id, ID, required: true
        argument :batch_mode, Boolean, required: false
        argument :undelete_only, Boolean, required: false
        argument :unconclude_only, Boolean, required: false
        field :progress, LMSGraphQL::Types::Canvas::CanvasProgress, null: false
        def resolve(account_id:, id:, batch_mode: nil, undelete_only: nil, unconclude_only: nil)
          context[:canvas_api].call("RESTORE_WORKFLOW_STATES_OF_SIS_IMPORTED_ITEMS").proxy(
            "RESTORE_WORKFLOW_STATES_OF_SIS_IMPORTED_ITEMS",
            {
              "account_id": account_id,
              "id": id
            },
            {
              "batch_mode": batch_mode,
              "undelete_only": undelete_only,
              "unconclude_only": unconclude_only
            },
          ).parsed_response
        end
      end
    end
  end
end