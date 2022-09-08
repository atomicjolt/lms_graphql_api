require_relative "../canvas_base_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasePortfolio < BaseType
          description "ePortfolios. API Docs: https://canvas.instructure.com/doc/api/e_portfolios.html"
        field :id, ID, "The database ID of the ePortfolio.Example: 1", null: true
        field :user_id, ID, "The user ID to which the ePortfolio belongs.Example: 1", null: true
        field :name, String, "The name of the ePortfolio.Example: My Academic Journey", null: true
        field :public, Boolean, "Whether or not the ePortfolio is visible without authentication.Example: true", null: true
        field :created_at, GraphQL::Types::ISO8601DateTime, "The creation timestamp for the ePortfolio.Example: 2021-09-20T18:59:37Z", null: true
        field :updated_at, GraphQL::Types::ISO8601DateTime, "The timestamp of the last time any of the ePortfolio attributes changed.Example: 2021-09-20T18:59:37Z", null: true
        field :workflow_state, String, "The state of the ePortfolio. Either 'active' or 'deleted'.Example: active", null: true
        field :deleted_at, GraphQL::Types::ISO8601DateTime, "The timestamp when the ePortfolio was deleted, or else null.Example: 2021-09-20T18:59:37Z", null: true
        field :spam_status, String, "A flag indicating whether the ePortfolio has been
      flagged or moderated as spam. One of 'flagged_as_possible_spam',
      'marked_as_safe', 'marked_as_spam', or null.", null: true

      end
    end
  end
end