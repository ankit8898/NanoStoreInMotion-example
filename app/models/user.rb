class User < NanoStore::Model
  #NanoStore.shared_store = NanoStore.store(:file, '../' + "/nano.db") # persist the data
  attribute :name
  attribute :mail
  attribute :created_at

  class << self
    def create_new name ,mail
     obj =  new(name: name,
                mail: mail,
                created_at: Time.now)
     obj.save
    end
  end
end