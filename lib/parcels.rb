require("pry")

class Parcel
  attr_reader :id, :name, :weight, :length, :width, :height

  @@parcels = {}
  @@total_rows = 0 

  def initialize(name, id, weight, length, width, height)
    @name = name
    @id = id || @@total_rows += 1
    @weight = weight
    @length = length
    @width = width
    @height = height
  end

  def self.all
    @@parcels.values()
  end

  def save 
    @@parcels[self.id] = Parcel.new(self.name, self.id, self.weight, self.length, self.width, self.height)
  end

  def ==(parcel_to_compare)
    self.name() == parcel_to_compare.name()
  end

  def self.clear
    @@parcels = {}
    @@total_rows = 0
  end

  def self.find(id)
    @@parcels[id]
  end

  def update(name, weight, height, length, width)
    @name = name
    @weight = weight
    @height = height
    @length = length
    @width = width
  end

  def delete
    @@parcels.delete(self.id)
  end
end

