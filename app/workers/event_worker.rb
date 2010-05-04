# handle asynchronous mooing.
class EventWorker < Workling::Base 
   def put(options)
       event = Event.create(options)
   end
end
                 
