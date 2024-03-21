defmodule LibraryFees do
  def datetime_from_string(string), do: elem(NaiveDateTime.from_iso8601(string), 1)

  def before_noon?(datetime), do: datetime.hour < 12

  def return_date(%{year: year, month: month, day: day} = checkout_datetime) do
    checkout_date = Date.new!(year, month, day)
    if before_noon?(checkout_datetime) do
      Date.add(checkout_date, 28)
    else
      Date.add(checkout_date, 29)
    end
  end

  def days_late(planned_return_date, actual_return_date), do: Date.diff(actual_return_date, planned_return_date)|>max(0)


  def monday?(datetime), do: Date.day_of_week(datetime) == 1

  def calculate_late_fee(checkout, return, rate) do
    checkout_datetime = datetime_from_string(checkout)
    return_datetime = datetime_from_string(return)
    raw_fee = days_late(return_date(checkout_datetime), return_datetime) * rate
    if monday?(return_datetime) do
      floor(raw_fee * 0.5)
    else
      raw_fee
    end
  end
end
