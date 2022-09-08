require_relative "../canvas_base_input_type"
require_relative "user"
require_relative "lock_info"

module LMSGraphQL
  module Types
    module Canvas
      class CanvasPageInput < BaseInputObject
          description "Pages. API Docs: https://canvas.instructure.com/doc/api/pages.html"
        argument :page_id, ID, "the ID of the page.Example: 1", required: false
        argument :url, String, "the unique locator for the page.Example: my-page-title", required: false
        argument :title, String, "the title of the page.Example: My Page Title", required: false
        argument :created_at, GraphQL::Types::ISO8601DateTime, "the creation date for the page.Example: 2012-08-06T16:46:33-06:00", required: false
        argument :updated_at, GraphQL::Types::ISO8601DateTime, "the date the page was last updated.Example: 2012-08-08T14:25:20-06:00", required: false
        argument :hide_from_students, Boolean, "(DEPRECATED) whether this page is hidden from students (note: this is always reflected as the inverse of the published value).", required: false
        argument :editing_roles, String, "roles allowed to edit the page; comma-separated list comprising a combination of 'teachers', 'students', 'members', and/or 'public' if not supplied, course defaults are used.Example: teachers,students", required: false
        argument :last_edited_by, LMSGraphQL::Types::Canvas::CanvasUserInput, "the User who last edited the page (this may not be present if the page was imported from another system).", required: false
        argument :body, String, "the page content, in HTML (present when requesting a single page; omitted when listing pages).Example: <p>Page Content</p>", required: false
        argument :published, Boolean, "whether the page is published (true) or draft state (false)..Example: true", required: false
        argument :front_page, Boolean, "whether this page is the front page for the wiki.", required: false
        argument :locked_for_user, Boolean, "Whether or not this is locked for the user..", required: false
        argument :lock_info, LMSGraphQL::Types::Canvas::CanvasLockInfoInput, "(Optional) Information for the user about the lock. Present when locked_for_user is true..", required: false
        argument :lock_explanation, String, "(Optional) An explanation of why this is locked for the user. Present when locked_for_user is true..Example: This page is locked until September 1 at 12:00am", required: false

      end
    end
  end
end