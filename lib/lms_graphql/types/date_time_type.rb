module LMSGraphQL
  module Types
    DateTimeType = ::GraphQL::ScalarType.define do
      name "DateTime"

      coerce_input ->(value, _ctx) { Time.zone.parse(value) }
      coerce_result ->(value, _ctx) {
        if value.is_a? String
          value = Time.zone.parse(value)
        end
        value.utc.iso8601
      }
    end
  end
end
