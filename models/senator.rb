class Senator
  attr_reader :name, :party, :state, :address, :phone_number,
              :web_page, :contact_link

  def initialize(data)
    @name = data[:name]
    @party = data[:party]
    @state = data[:state]
    @address = data[:address]
    @phone_number = data[:phone_number]
    @web_page = data[:web_page]
    @contact_link = data[:contact_link]
  end
end


