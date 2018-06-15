require_relative "../canvas_base_input_type"
require_relative "user"

module LMSGraphQL
  module Types
    module Canvas
      class CanvasPageRevisionInput < BaseInputObject
        description "Pages. API Docs: https://canvas.instructure.com/doc/api/pages.html"
        argument :revision_id, ID, "an identifier for this revision of the page.Example: 7", required: false
        argument :updated_at, LMSGraphQL::Types::DateTimeType, "the time when this revision was saved.Example: 2012-08-07T11:23:58-06:00", required: false
        argument :latest, Boolean, "whether this is the latest revision or not.Example: true", required: false
        argument :edited_by, LMSGraphQL::Types::Canvas::CanvasUser, "the User who saved this revision, if applicable (this may not be present if the page was imported from another system).", required: false
        argument :url, String, "the following fields are not included in the index action and may be omitted from the show action via summary=1 the historic url of the page.Example: old-page-title", required: false
        argument :title, String, "the historic page title.Example: Old Page Title", required: false
        argument :body, String, "the historic page contents.Example: <p>Old Page Content</p>", required: false

      end
    end
  end
end