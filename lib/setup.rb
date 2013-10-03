require_relative 'csv_reader'
require_relative 'area'

class Setup
  attr_accessor :areas
  def initialize
    csv_reader = CSVReader.new("./free-zipcode-database")
    @areas = []
    csv_reader.read do |item|
      @areas << Area.new(item)
    end
    self
  end

end
