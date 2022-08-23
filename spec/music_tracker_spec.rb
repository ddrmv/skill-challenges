require 'music_tracker'

RSpec.describe MusicTracker do
  context "empty list" do
    it "#list returns empty list" do
    tracker = MusicTracker.new
    expect(tracker.list).to eq []
    end
  end

  context "multiple entries" do
    it "adds multiple tracks and lists them" do
      tracker = MusicTracker.new
      tracker.add("track 1")
      tracker.add("track 1")
      tracker.add("track 2")
      expect(tracker.list).to eq ["track 1", "track 1", "track 2"]
    end

    it "adds multiple tracks skips empty" do
      tracker = MusicTracker.new
      tracker.add("track 1")
      tracker.add("")
      tracker.add("track 2")
      expect(tracker.list).to eq ["track 1", "track 2"]
    end
  end
end