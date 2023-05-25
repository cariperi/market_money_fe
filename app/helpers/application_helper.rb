module ApplicationHelper
  def format_address(market)
    "#{market.city}, #{market.state} #{market.zip}"
  end
end
