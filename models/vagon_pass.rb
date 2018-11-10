require_relative 'vagon.rb'

class PassangerVagon < Vagon
  def initialize(number)
    super
    @type = :passanger
  end
end
