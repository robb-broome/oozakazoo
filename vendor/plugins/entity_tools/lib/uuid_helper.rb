module UUIDHelper
  # This module
  # assists with using UUIDs for item references in all the other items.
  # Some thoughts:
  # At this point, not sure that the TYPE entries should be in the entity table also
  # but it makes nice symmetry, since this would have the same tracking and versioning.

  # Global item types
  # TODO: how to look these up in a catalog?
  include Ent::Globals
  def before_create()
    puts 'before creating!'
    self.uuid = UUID.create_random.to_s
  end
end