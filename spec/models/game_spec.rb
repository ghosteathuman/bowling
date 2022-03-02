require "rails_helper"

RSpec.describe Game, type: :model do
  let(:game) { create(:game) }

  it "records all strikes" do
    11.times do
      game.record_pins(10)
      game.calculate_score
    end

    expect(game.frames.length).to eq 11
    expect(game.calculate_score).to eq 300
    expect(game.frame_score.elements).to eq [30, 30, 30, 30, 30, 30, 30, 30, 30, 20, 10]
  end

  it "will not record strikes beyond 11 frames" do
    12.times do
      game.record_pins(10)
      game.calculate_score
    end

    expect(game.frames.length).to eq 11
    expect(game.calculate_score).to eq 300
    expect(game.frame_score.elements).to eq [30, 30, 30, 30, 30, 30, 30, 30, 30, 20, 10]
  end

  it "records all spares" do
    21.times do
      game.record_pins(5)
      game.calculate_score
    end

    expect(game.frames.length).to eq 11
    expect(game.calculate_score).to eq 155
    expect(game.frame_score.elements).to eq [15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 5]
  end
end
