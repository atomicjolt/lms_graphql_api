require_relative "../canvas_base_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasePortfolioPage < BaseType
          description "ePortfolios. API Docs: https://canvas.instructure.com/doc/api/e_portfolios.html"
        field :id, ID, "The database ID of the ePortfolio.Example: 1", null: true
        field :eportfolio_id, ID, "The ePortfolio ID to which the entry belongs.Example: 1", null: true
        field :position, Int, "The positional order of the entry in the list.Example: 1", null: true
        field :name, String, "The name of the ePortfolio.Example: My Academic Journey", null: true
        field :content, String, "The user entered content of the entry.Example: A long time ago.", null: true
        field :created_at, GraphQL::Types::ISO8601DateTime, "The creation timestamp for the ePortfolio.Example: 2021-09-20T18:59:37Z", null: true
        field :updated_at, GraphQL::Types::ISO8601DateTime, "The timestamp of the last time any of the ePortfolio attributes changed.Example: 2021-09-20T18:59:37Z", null: true

      end
    end
  end
end