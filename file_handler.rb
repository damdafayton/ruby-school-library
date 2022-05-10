require 'json'
require 'pry'

def string_to_array(str)
  pair_list = str.split(',')
  return_object = {}
  pair_list.each {|pair|
    splitted_pair = pair.split(':')      
    return_object[splitted_pair[0].strip.downcase.to_sym] = splitted_pair[1].strip
  }
  return_object
end


class FileHandler
  def initialize(filename)
    @file_name = "#{filename}.json"
    write([]) unless File.file?(@file_name)
  end

  def read
    data = File.read(@file_name)
    parsed = JSON.parse(data)
    return parsed
  end

  def write(data)
    json = JSON.generate(data)
    binding.pry
    File.write(@file_name, json)
  end

  def close
    @file.close
  end
  
end