class Vendor
attr_reader :name,
            :description,
            :contact_name,
            :contact_phone,
            :credit_accepted,
            :id

  def initialize(data)
    @name = data[:name]
    @description = data[:description]
    @contact_name = data[:contact_name]
    @contact_phone = data[:contact_phone]
    @credit_accepted = data[:credit_accepted]
    @id = data[:id]
  end
end