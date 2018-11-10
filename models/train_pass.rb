require_relative 'train.rb'
require_relative 'route.rb'
require_relative 'station.rb'

class PassangerTrain < Train
  def initialize(number)
    super
    @type = :passanger
  end
end

s1 = Station.new("s1")
s2 = Station.new("s2")
s3 = Station.new("s3")
s4 = Station.new("s4")

r = Route.new(s1, s4)
r.add_station(s2)
r.add_station(s3)

t = PassangerTrain.new("12312321")

t.accept_route(r)

t.forward
t.forward
t.forward

p t.current_station


