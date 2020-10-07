#!/usr/bin/env ruby

class ChangeCoordinates
  def initialize(params)
    @data = params
    @file = File.open(params).read if params.match(/csv|txt/)
  end
end
