class Types::AuthorType < Types::BaseObject
  description 'One Author'

  # if null is false and the field is null, it is going to show a message saying that it cannot show the field because it does not permit null value

  field :id, ID, null: false
  field :first_name, String, null: true, camelize: false
  field :last_name, String, null: true
  field :yob, Integer, null: true
  field :is_alive, Boolean, null: true
  field :created_at, GraphQL::Types::ISO8601DateTime, null: false
end
