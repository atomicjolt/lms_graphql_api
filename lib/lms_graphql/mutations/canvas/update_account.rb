require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/account"
module LMSGraphQL
  module Mutations
    module Canvas
      class UpdateAccount < BaseMutation
        argument :id, ID, required: true
        argument :account_name, String, required: false
        argument :account_sis_account_id, String, required: false
        argument :account_default_time_zone, String, required: false
        argument :account_default_storage_quota_mb, Int, required: false
        argument :account_default_user_storage_quota_mb, Int, required: false
        argument :account_default_group_storage_quota_mb, Int, required: false
        argument :account_course_template_id, Int, required: false
        argument :account_settings_restrict_student_past_view_value, Boolean, required: false
        argument :account_settings_restrict_student_past_view_locked, Boolean, required: false
        argument :account_settings_restrict_student_future_view_value, Boolean, required: false
        argument :account_settings_restrict_student_future_view_locked, Boolean, required: false
        argument :account_settings_lock_all_announcements_value, Boolean, required: false
        argument :account_settings_lock_all_announcements_locked, Boolean, required: false
        argument :account_settings_usage_rights_required_value, Boolean, required: false
        argument :account_settings_usage_rights_required_locked, Boolean, required: false
        argument :account_settings_restrict_student_future_listing_value, Boolean, required: false
        argument :account_settings_restrict_student_future_listing_locked, Boolean, required: false
        argument :account_settings_lock_outcome_proficiency_value, Boolean, required: false
        argument :account_lock_outcome_proficiency_locked, Boolean, required: false
        argument :account_settings_lock_proficiency_calculation_value, Boolean, required: false
        argument :account_lock_proficiency_calculation_locked, Boolean, required: false
        argument :account_services, String, required: false
        
        
        field :account, LMSGraphQL::Types::Canvas::CanvasAccount, null: false
        
        def resolve(id:, account_name: nil, account_sis_account_id: nil, account_default_time_zone: nil, account_default_storage_quota_mb: nil, account_default_user_storage_quota_mb: nil, account_default_group_storage_quota_mb: nil, account_course_template_id: nil, account_settings_restrict_student_past_view_value: nil, account_settings_restrict_student_past_view_locked: nil, account_settings_restrict_student_future_view_value: nil, account_settings_restrict_student_future_view_locked: nil, account_settings_lock_all_announcements_value: nil, account_settings_lock_all_announcements_locked: nil, account_settings_usage_rights_required_value: nil, account_settings_usage_rights_required_locked: nil, account_settings_restrict_student_future_listing_value: nil, account_settings_restrict_student_future_listing_locked: nil, account_settings_lock_outcome_proficiency_value: nil, account_lock_outcome_proficiency_locked: nil, account_settings_lock_proficiency_calculation_value: nil, account_lock_proficiency_calculation_locked: nil, account_services: nil)
          context[:canvas_api].call("UPDATE_ACCOUNT").proxy(
            "UPDATE_ACCOUNT",
            {
              "id": id
            },
            {
              "account[name]": account_name,
              "account[sis_account_id]": account_sis_account_id,
              "account[default_time_zone]": account_default_time_zone,
              "account[default_storage_quota_mb]": account_default_storage_quota_mb,
              "account[default_user_storage_quota_mb]": account_default_user_storage_quota_mb,
              "account[default_group_storage_quota_mb]": account_default_group_storage_quota_mb,
              "account[course_template_id]": account_course_template_id,
              "account[settings][restrict_student_past_view][value]": account_settings_restrict_student_past_view_value,
              "account[settings][restrict_student_past_view][locked]": account_settings_restrict_student_past_view_locked,
              "account[settings][restrict_student_future_view][value]": account_settings_restrict_student_future_view_value,
              "account[settings][restrict_student_future_view][locked]": account_settings_restrict_student_future_view_locked,
              "account[settings][lock_all_announcements][value]": account_settings_lock_all_announcements_value,
              "account[settings][lock_all_announcements][locked]": account_settings_lock_all_announcements_locked,
              "account[settings][usage_rights_required][value]": account_settings_usage_rights_required_value,
              "account[settings][usage_rights_required][locked]": account_settings_usage_rights_required_locked,
              "account[settings][restrict_student_future_listing][value]": account_settings_restrict_student_future_listing_value,
              "account[settings][restrict_student_future_listing][locked]": account_settings_restrict_student_future_listing_locked,
              "account[settings][lock_outcome_proficiency][value]": account_settings_lock_outcome_proficiency_value,
              "account[lock_outcome_proficiency][locked]": account_lock_outcome_proficiency_locked,
              "account[settings][lock_proficiency_calculation][value]": account_settings_lock_proficiency_calculation_value,
              "account[lock_proficiency_calculation][locked]": account_lock_proficiency_calculation_locked,
              "account[services]": account_services
            },
          ).parsed_response
        end
      end
    end
  end
end