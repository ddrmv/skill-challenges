class MusicTracker
  def initialize
    @tracks = []
  end

  def add(track)
    @tracks << track if track != ""
  end

  def list
    return @tracks
  end
end