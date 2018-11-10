require_relative 'vagon.rb'

class CargoVagon < Vagon
  def initialize(number)
    super
    @type = :cargo
  end
end
