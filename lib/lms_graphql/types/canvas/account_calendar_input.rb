require_relative "../canvas_base_input_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasAccountCalendarInput < BaseInputObject
          description "Account Calendars. API Docs: https://canvas.instructure.com/doc/api/account_calendars.html"
        argument :id, ID, "the ID of the account associated with this calendar.Example: 204", required: false
        argument :name, String, "the name of the account associated with this calendar.Example: Department of Chemistry", required: false
        argument :parent_account_id, ID, "the account's parent ID, or null if this is the root account.Example: 1", required: false
        argument :root_account_id, ID, "the ID of the root account, or null if this is the root account.Example: 1", required: false
        argument :visible, Boolean, "whether this calendar is visible to users.Example: true", required: false
        argument :sub_account_count, Int, "number of this account's direct sub-accounts.Example: 0", required: false

      end
    end
  end
end