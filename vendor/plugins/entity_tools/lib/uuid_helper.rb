module UUIDHelper
  # This module
  # assists with using UUIDs for item references in all the other items.
  # Some thoughts:
  # At this point, not sure that the TYPE entries should be in the entity table also
  # but it makes nice symmetry, since this would have the same tracking and versioning.
  include Ent::Globals
  def before_create()
    puts "before the trigger, my uuid is #{self.uuid.inspect}"
    if self.uuid.blank?
      self.uuid ||= UUID.create_random.to_s
    end 
  end
end