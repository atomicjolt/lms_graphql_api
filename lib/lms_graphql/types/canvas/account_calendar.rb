require_relative "../canvas_base_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasAccountCalendar < BaseType
          description "Account Calendars. API Docs: https://canvas.instructure.com/doc/api/account_calendars.html"
        field :id, ID, "the ID of the account associated with this calendar.Example: 204", null: true
        field :name, String, "the name of the account associated with this calendar.Example: Department of Chemistry", null: true
        field :parent_account_id, ID, "the account's parent ID, or null if this is the root account.Example: 1", null: true
        field :root_account_id, ID, "the ID of the root account, or null if this is the root account.Example: 1", null: true
        field :visible, Boolean, "whether this calendar is visible to users.Example: true", null: true
        field :sub_account_count, Int, "number of this account's direct sub-accounts.Example: 0", null: true

      end
    end
  end
end