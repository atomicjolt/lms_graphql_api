require_relative "../canvas_base_input_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasExternalFeedInput < BaseInputObject
          class ExternalFeedInputVerbosityEnum < ::GraphQL::Schema::Enum
          value "link_only"
          value "truncate"
          value "full"
        end
        description "Announcement External Feeds. API Docs: https://canvas.instructure.com/doc/api/announcement_external_feeds.html"
      argument :id, ID, "The ID of the feed.Example: 5", required: false
      argument :display_name, String, "The title of the feed, pulled from the feed itself. If the feed hasn't yet been pulled, a temporary name will be synthesized based on the URL.Example: My Blog", required: false
      argument :url, String, "The HTTP/HTTPS URL to the feed.Example: http://example.com/myblog.rss", required: false
      argument :header_match, String, "If not null, only feed entries whose title contains this string will trigger new posts in Canvas.Example: pattern", required: false
      argument :created_at, LMSGraphQL::Types::DateTimeType, "When this external feed was added to Canvas.Example: 2012-06-01T00:00:00-06:00", required: false
      argument :verbosity, ExternalFeedInputVerbosityEnum, "The verbosity setting determines how much of the feed's content is imported into Canvas as part of the posting. 'link_only' means that only the title and a link to the item. 'truncate' means that a summary of the first portion of the item body will be used. 'full' means that the full item body will be used..Example: truncate", required: false

      end
    end
  end
end