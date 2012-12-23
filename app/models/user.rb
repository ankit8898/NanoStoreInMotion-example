class User < NanoStore::Model
  #NanoStore.shared_store = NanoStore.store(:file, '../' + "/nano.db") # persist the data
  attribute :name
  attribute :email
  attribute :created_at

  class << self
    def create_new name ,email
     obj =  new(name: name,
                email: email,
                created_at: Time.now)
     obj.save
    end
  end
end