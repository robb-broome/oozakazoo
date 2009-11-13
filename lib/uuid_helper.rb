module UUIDHelper
  def before_create()
    self.uuid = UUID.create_random.to_s
  end
end