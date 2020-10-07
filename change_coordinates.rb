#!/usr/bin/env ruby

class ChangeCoordinates
  def initialize(params)
    @data = params
    @file = File.open(params).read if params.match(/csv|txt/)
  end

  def read_data(data_or_file)
    @read_data = data_or_file.gsub(/\n/, ',').split(',').reject { |d| d.empty? }
  end

  def set_upland
    @upland_x = @read_data[0].split(' ')[0].to_i
    @upland_y = @read_data[0].split(' ')[1].to_i
  end

  def group_space_probes
    @read_data.flatten.drop(1).each_slice(2).to_a
  end

  def turn_left(direction)
    case direction
    when 'N'
      'W'
    when 'S'
      'E'
    when 'W'
      'S'
    when 'E'
      'N'
    end
  end
end
