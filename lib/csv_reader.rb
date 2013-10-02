class CSVReader
  attr_accessor :fname, :headers

  def initialize(filename)
    @fname = filename
  end

  def headers=(header_str)
    @headers = header_str.split(',')
    @headers.map! do |h|
      h.gsub('"','')
      h.strip!
      h.underscore.to_sym
    end
  end

  def create_hash(values)
    hash = {}
    @headers.each_with_index do |header, index|
      value = values[i].strip.gsub('"', '')
      h[header] = value unless value.empty?
    end
    h
  end

end

class String
  def underscore
    self.gsub(/::/, '/').
    gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2').
    gsub(/([a-z\d])([A-Z])/,'\1_\2').
    tr("-", "_").
    downcase
  end
end

