class Types::AuthorType < Types::BaseObject
  description 'One Author'

  # if null is false and the field is null, it is going to show a message saying that it cannot show the field because it does not permit null value

  field :id, ID, null: false
  field :first_name, String, null: true, camelize: false
  field :last_name, String, null: true
  field :yob, Integer, null: true
  field :is_alive, Boolean, null: true
  field :created_at, GraphQL::Types::ISO8601DateTime, null: false

  field :full_name, String, null: true # field made in the model
  field :description, String, null: true

  def description
    "#{object.first_name} #{object.last_name} was born on #{object.yob}"
  end

  field :coordinates, Types::CoordinatesType, null: false # calling coordinates from Author model
  field :publication_years, [Int], null: false
end
