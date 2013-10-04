class CSVReader
  attr_accessor :fname, :headers

  def initialize(filename)
    @fname = filename
  end

  def headers=(header_str)
    @headers = header_str.split(',')
    @headers.map! do |h|
      h.gsub!('"','')
      h.strip!
      h.underscore.to_sym
      #puts h
    end
  end

  def create_hash(values)
    h = {}
    @headers.each_with_index do |header, i|
      value = values[i].strip.gsub('"', '')
      h[header] = value unless value.empty?
    end
    #puts h
    h
  end

  def read
    f = File.new(@fname, 'r')
    self.headers = f.readline
    #puts self.headers
    while(!f.eof? && next_line = f.readline)
      values = next_line.split(',')
      hash = create_hash(values)
      #puts hash
      yield(hash)
    end
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

