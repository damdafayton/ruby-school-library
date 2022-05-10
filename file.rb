require 'json'

class File
  def initialize(filename)
    @file_name = "#{filename}.json"
    # @file = File.open(filename, "w")
  end

  def read
    return File.file?(@file_name) ? File.read(@file_name) : []
  end

  def write(data)
    File.write(@file_name, data)
  end

  def close
    @file.close
  end
  
end