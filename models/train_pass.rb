require_relative 'train.rb'
require_relative 'route.rb'
require_relative 'station.rb'

class PassangerTrain < Train
  def initialize(number)
    super
    @type = :passanger
  end
end
