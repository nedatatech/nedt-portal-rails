module ApplicationHelper
  def convert_time(to_be_converted) format = "%-m/%d/%Y %-I:%M%P"
    if to_be_converted.class == Date
      to_be_converted.strftime('%-m/%d/%Y')
    else
      to_be_converted.strftime(format)
    end
  end
end
