require_relative 'vagon.rb'

class CargoVagon < Vagon
  def initialize(number)
    super
    @type = :passanger
  end
end
