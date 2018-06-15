require_relative "../canvas_base_input_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasAccountInput < BaseInputObject
        description "Accounts. API Docs: https://canvas.instructure.com/doc/api/accounts.html"
        argument :id, ID, "the ID of the Account object.Example: 2", required: false
        argument :name, String, "The display name of the account.Example: Canvas Account", required: false
        argument :uuid, String, "The UUID of the account.Example: WvAHhY5FINzq5IyRIJybGeiXyFkG3SqHUPb7jZY5", required: false
        argument :parent_account_id, ID, "The account's parent ID, or null if this is the root account.Example: 1", required: false
        argument :root_account_id, ID, "The ID of the root account, or null if this is the root account.Example: 1", required: false
        argument :default_storage_quota_mb, Int, "The storage quota for the account in megabytes, if not otherwise specified.Example: 500", required: false
        argument :default_user_storage_quota_mb, Int, "The storage quota for a user in the account in megabytes, if not otherwise specified.Example: 50", required: false
        argument :default_group_storage_quota_mb, Int, "The storage quota for a group in the account in megabytes, if not otherwise specified.Example: 50", required: false
        argument :default_time_zone, String, "The default time zone of the account. Allowed time zones are {http://www.iana.org/time-zones IANA time zones} or friendlier {http://api.rubyonrails.org/classes/ActiveSupport/TimeZone.html Ruby on Rails time zones}..Example: America/Denver", required: false
        argument :sis_account_id, ID, "The account's identifier in the Student Information System. Only included if the user has permission to view SIS information..Example: 123xyz", required: false
        argument :integration_id, ID, "The account's identifier in the Student Information System. Only included if the user has permission to view SIS information..Example: 123xyz", required: false
        argument :sis_import_id, ID, "The id of the SIS import if created through SIS. Only included if the user has permission to manage SIS information..Example: 12", required: false
        argument :lti_guid, String, "The account's identifier that is sent as context_id in LTI launches..Example: 123xyz", required: false
        argument :workflow_state, String, "The state of the account. Can be 'active' or 'deleted'..Example: active", required: false

      end
    end
  end
end