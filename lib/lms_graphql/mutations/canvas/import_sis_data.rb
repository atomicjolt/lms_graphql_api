require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/sis_import"
module LMSGraphQL
  module Mutations
    module Canvas
      class ImportSisDatum < BaseMutation
        argument :account_id, ID, required: true
        argument :import_type, String, required: false
        argument :attachment, String, required: false
        argument :extension, String, required: false
        argument :batch_mode, Boolean, required: false
        argument :batch_mode_term_id, ID, required: false
        argument :multi_term_batch_mode, Boolean, required: false
        argument :skip_deletes, Boolean, required: false
        argument :override_sis_stickiness, Boolean, required: false
        argument :add_sis_stickiness, Boolean, required: false
        argument :clear_sis_stickiness, Boolean, required: false
        argument :update_sis_id_if_login_claimed, Boolean, required: false
        argument :diffing_data_set_identifier, String, required: false
        argument :diffing_remaster_data_set, Boolean, required: false
        argument :diffing_drop_status, String, required: false
        argument :batch_mode_enrollment_drop_status, String, required: false
        argument :change_threshold, Int, required: false
        argument :diff_row_count_threshold, Int, required: false
        
        
        field :sis_import, LMSGraphQL::Types::Canvas::CanvasSisImport, null: false
        
        def resolve(account_id:, import_type: nil, attachment: nil, extension: nil, batch_mode: nil, batch_mode_term_id: nil, multi_term_batch_mode: nil, skip_deletes: nil, override_sis_stickiness: nil, add_sis_stickiness: nil, clear_sis_stickiness: nil, update_sis_id_if_login_claimed: nil, diffing_data_set_identifier: nil, diffing_remaster_data_set: nil, diffing_drop_status: nil, batch_mode_enrollment_drop_status: nil, change_threshold: nil, diff_row_count_threshold: nil)
          context[:canvas_api].call("IMPORT_SIS_DATA").proxy(
            "IMPORT_SIS_DATA",
            {
              "account_id": account_id
            },
            {
              "import_type": import_type,
              "attachment": attachment,
              "extension": extension,
              "batch_mode": batch_mode,
              "batch_mode_term_id": batch_mode_term_id,
              "multi_term_batch_mode": multi_term_batch_mode,
              "skip_deletes": skip_deletes,
              "override_sis_stickiness": override_sis_stickiness,
              "add_sis_stickiness": add_sis_stickiness,
              "clear_sis_stickiness": clear_sis_stickiness,
              "update_sis_id_if_login_claimed": update_sis_id_if_login_claimed,
              "diffing_data_set_identifier": diffing_data_set_identifier,
              "diffing_remaster_data_set": diffing_remaster_data_set,
              "diffing_drop_status": diffing_drop_status,
              "batch_mode_enrollment_drop_status": batch_mode_enrollment_drop_status,
              "change_threshold": change_threshold,
              "diff_row_count_threshold": diff_row_count_threshold
            },
          ).parsed_response
        end
      end
    end
  end
end