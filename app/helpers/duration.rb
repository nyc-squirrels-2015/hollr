SECONDS_PER_DAY = 24 * 60 * 60
SECONDS_PER_HOUR = 60 * 60
SECONDS_PER_MINUTE = 60

def duration(t_start, t_end)
  interval = t_end - t_start
  days, seconds = interval.divmod(SECONDS_PER_DAY)
  hours, seconds = seconds.divmod(SECONDS_PER_HOUR)
  minutes, seconds = seconds.divmod(SECONDS_PER_MINUTE)

  [days, hours, minutes, seconds.round]
end

def ago(t_created)
  days, hours, minutes = duration(t_created, Time.now)

  return "#{inflect(days, 'day')} ago" if days > 0
  return "#{inflect(hours, 'hour')} ago" if hours > 0
  return "#{inflect(minutes, 'minute')} ago" if minutes > 0

end

