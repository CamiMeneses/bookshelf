class Types::CoordinatesType < Types::BaseObject
  field :latitude, Float, null: true
  field :longitude, Float, null: false

  def latitude
    object.first
  end

  def longitude
    object.last
  end
end
