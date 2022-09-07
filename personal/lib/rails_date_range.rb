require 'active_support/all'
class RailsDateRange < Range
  # step is similar to DateTime#advance argument
  def every(step)
    c_time = self.begin.to_datetime
    finish_time = self.end.to_datetime
    foo_compare = exclude_end? ? :< : :<=

    arr = []
    while c_time.send(foo_compare, finish_time)
      arr << c_time
      c_time = c_time.advance(step)
    end

    arr
  end
end
