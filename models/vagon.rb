class Vagon
  attr_reader :type, :number

  def initialize(number)
    @number = number
  end

  def to_s
    "Вагон тип #{@type}, номер #{number}"
  end
end
