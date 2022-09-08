require_relative "../canvas_base_input_type"
require_relative "outcome_group"

module LMSGraphQL
  module Types
    module Canvas
      class CanvasOutcomeGroupInput < BaseInputObject
          description "Outcome Groups. API Docs: https://canvas.instructure.com/doc/api/outcome_groups.html"
        argument :id, ID, "the ID of the outcome group.Example: 1", required: false
        argument :url, String, "the URL for fetching/updating the outcome group. should be treated as opaque.Example: /api/v1/accounts/1/outcome_groups/1", required: false
        argument :parent_outcome_group, LMSGraphQL::Types::Canvas::CanvasOutcomeGroupInput, "an abbreviated OutcomeGroup object representing the parent group of this outcome group, if any. omitted in the abbreviated form..", required: false
        argument :context_id, ID, "the context owning the outcome group. may be null for global outcome groups. omitted in the abbreviated form..Example: 1", required: false
        argument :context_type, String, "Example: Account", required: false
        argument :title, String, "title of the outcome group.Example: Outcome group title", required: false
        argument :description, String, "description of the outcome group. omitted in the abbreviated form..Example: Outcome group description", required: false
        argument :vendor_guid, String, "A custom GUID for the learning standard..Example: customid9000", required: false
        argument :subgroups_url, String, "the URL for listing/creating subgroups under the outcome group. should be treated as opaque.Example: /api/v1/accounts/1/outcome_groups/1/subgroups", required: false
        argument :outcomes_url, String, "the URL for listing/creating outcome links under the outcome group. should be treated as opaque.Example: /api/v1/accounts/1/outcome_groups/1/outcomes", required: false
        argument :import_url, String, "the URL for importing another group into this outcome group. should be treated as opaque. omitted in the abbreviated form..Example: /api/v1/accounts/1/outcome_groups/1/import", required: false
        argument :can_edit, Boolean, "whether the current user can update the outcome group.Example: true", required: false

      end
    end
  end
end