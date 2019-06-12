class Location

  attr_accessor :branch_name, :address, :phone_number, :librarians_email, :about_page_url

  @@all = []

  def initialize(location_hash)
    location_hash.each do |attribute, value|
      self.send("#{attribute}=", value)
    end
    @@all << self
  end

  def self.create_from_collection(locations_array)
    locations_array.each do |branch_hash|
      Location.new(branch_hash)
    end
  end

  def add_location_attributes(attributes_hash)
    attributes_hash.each do |attr, value|
      self.send("#{attr}=", value)
    end
    self
  end

  def self.all
    @@all
  end
end