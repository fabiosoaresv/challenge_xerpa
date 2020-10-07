#!/usr/bin/env ruby

class ChangeCoordinates
  def initialize(params)
    @data = params
    @file = File.open(params).read if params.match(/csv|txt/)
  end

  private

  def execute_file_or_data(data_or_file)
    result = []
    read_data(data_or_file)
    set_upland

    upland = [@upland_x, @upland_y]

    group_space_probes.each do |coordinate, commands|
      x = coordinate.split[0]
      y = coordinate.split[1]
      direction = coordinate.split[2]

      result << update_coordinate(x, y, direction, commands, upland)
    end

    return false if result.include?(false)

    result.each do |row|
      puts row.join(' ').to_s
    end
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

  def update_coordinate(x, y, direction, commands, upland)
    commands = commands.split('')
    @final_direction = direction
    @final_x = x
    @final_y = y

    commands.each do |command|
      if command  == 'M'
        request = go_ahead(@final_x, @final_y, @final_direction)
        @final_x = request[:x]
        @final_y = request[:y]
      elsif command == 'L'
        @final_direction = turn_left(@final_direction)
      elsif command == 'R'
        @final_direction = turn_right(@final_direction)
      end
    end

    return false if final_position_is_invalid?(upland[0], upland[1], @final_x, @final_y)

    [@final_x, @final_y, @final_direction]
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

  def turn_right(direction)
    case direction
    when 'N'
      'E'
    when 'S'
      'W'
    when 'W'
      'N'
    when 'E'
      'S'
    end
  end

  def go_ahead(x, y, direction)
    x = x.to_i
    y = y.to_i

    case direction
    when 'N'
      { x: x, y: y + 1 }
    when 'S'
      { x: x, y: y - 1 }
    when 'W'
      { x: x - 1, y: y }
    when 'E'
      { x: x + 1, y: y }
    end
  end

  def final_position_is_invalid?(upland_x, upland_y, x, y)
    x > upland_x || y > upland_y
  end
end
