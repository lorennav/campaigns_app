module ApplicationHelper
  def format_date(date)
    date.strftime('%d/%m/%Y at %I:%M%p')
  end

  def badge(color)
    "bg-#{color}-100 px-[0.65em] pb-[0.25em] pt-[0.35em] text-center
      align-baseline text-[0.75em] font-bold leading-none text-#{color}-600"
  end
end
