module MoviesHelper

  def formatted_date(date)
    date.strftime("%b %d, %Y")
  end

  def year(date)
    date.strftime("%Y")
  end

  def min_to_hr(duration)
    hr = duration / 60
    min = duration % 60
    "#{hr.floor}h #{min}min"
  end

end
