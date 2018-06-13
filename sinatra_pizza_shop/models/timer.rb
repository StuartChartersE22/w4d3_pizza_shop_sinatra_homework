
class Timer

  attr_reader(:countdown_time)

  def initialize(start_point)
    time_as_array = start_point.split(":").reverse()
    case time_as_array.length()
      when 1
        @time_in_sec = time_as_array[0].to_i()
      when 2
        @time_in_sec = time_as_array[0].to_i() + time_as_array[1].to_i()*60
      when 3
        @time_in_sec = time_as_array[0].to_i() + time_as_array[1].to_i()*60 + time_as_array[2]*3600
    end
    @countdown_time = 0
  end

  def show_full()
    sec = @time_in_sec%60
    min = (@time_in_sec/60)%60
    hour = @time_in_sec/3600
    return "%02d:%02d:%02d" % [hour, min, sec]
  end

  def show_sec()
    return @time_in_sec
  end

  def countdown_sec()
    new_time = 61
    @countdown_time = @time_in_sec
    until @countdown_time == 0
      unless new_time == Time.now().sec()
        new_time = Time.now().sec()
        @countdown_time -= 1
      end
    end
  end

  def countdown_full()
    new_time = 61
    @countdown_time = @time_in_sec
    until @countdown_time == 0
      unless new_time == Time.now().sec()
        new_time = Time.now().sec()
        @countdown_time -= 1
        countdown_time_full()
      end
    end
  end

  def countdown_time_full()
    sec = @countdown_time%60
    min = (@countdown_time/60)%60
    hour = @countdown_time/3600
    return "%02d:%02d:%02d" % [hour, min, sec]
  end

end
