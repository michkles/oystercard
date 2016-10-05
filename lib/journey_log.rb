require_relative 'journey'

class JourneyLog

  attr_reader :journey_history

  def initialize
    @journey_history = []
  end

end
