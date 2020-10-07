#!/usr/bin/env ruby

class ChangeCoordinates
  def initialize(params)
    @data = params
    @file = File.open(params).read if params.match(/csv|txt/)
  end

  def read_data(data_or_file)
    @read_data = data_or_file.gsub(/\n/, ',').split(',').reject { |d| d.empty? }
  end
end
