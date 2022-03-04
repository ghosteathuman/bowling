require "rails_helper"

RSpec.describe Game, type: :model do
  let(:game) { create(:game) }

  it "records score and generate frames accurately after each score" do
    game.record_pins(10)
    expect(game.frames.length).to eq 1
    expect(game.calculate_score).to eq 10
    expect(game.frame_score.elements).to eq [10]

    game.record_pins(10)
    expect(game.frames.length).to eq 2
    expect(game.calculate_score).to eq 20
    expect(game.frame_score.elements).to eq [10, 20]

    game.record_pins(10)
    expect(game.frames.length).to eq 3
    expect(game.calculate_score).to eq 50
    expect(game.frame_score.elements).to eq [30, 40, 50]

    game.record_pins(5)
    expect(game.frames.length).to eq 4
    expect(game.calculate_score).to eq 70
    expect(game.frame_score.elements).to eq [30, 55, 65, 70]

    game.record_pins(5)
    expect(game.frames.length).to eq 4
    expect(game.calculate_score).to eq 75
    expect(game.frame_score.elements).to eq [30, 55, 65, 75]

    game.record_pins(3)
    expect(game.frames.length).to eq 5
    expect(game.calculate_score).to eq 91
    expect(game.frame_score.elements).to eq [30, 55, 75, 88, 91]

    game.record_pins(2)
    expect(game.frames.length).to eq 5
    expect(game.calculate_score).to eq 93
    expect(game.frame_score.elements).to eq [30, 55, 75, 88, 93]

    game.record_pins(8)
    expect(game.frames.length).to eq 6
    expect(game.calculate_score).to eq 101
    expect(game.frame_score.elements).to eq [30, 55, 75, 88, 93, 101]

    game.record_pins(1)
    expect(game.frames.length).to eq 6
    expect(game.calculate_score).to eq 102
    expect(game.frame_score.elements).to eq [30, 55, 75, 88, 93, 102]

    game.record_pins(3)
    expect(game.frames.length).to eq 7
    expect(game.calculate_score).to eq 105
    expect(game.frame_score.elements).to eq [30, 55, 75, 88, 93, 102, 105]

    game.record_pins(5)
    expect(game.frames.length).to eq 7
    expect(game.calculate_score).to eq 110
    expect(game.frame_score.elements).to eq [30, 55, 75, 88, 93, 102, 110]

    game.record_pins(10)
    expect(game.frames.length).to eq 8
    expect(game.calculate_score).to eq 120
    expect(game.frame_score.elements).to eq [30, 55, 75, 88, 93, 102, 110, 120]

    game.record_pins(4)
    expect(game.frames.length).to eq 9
    expect(game.calculate_score).to eq 124
    expect(game.frame_score.elements).to eq [30, 55, 75, 88, 93, 102, 110, 120, 124]

    game.record_pins(2)
    expect(game.frames.length).to eq 9
    expect(game.calculate_score).to eq 126
    expect(game.frame_score.elements).to eq [30, 55, 75, 88, 93, 102, 110, 120, 126]

    game.record_pins(3)
    expect(game.frames.length).to eq 10
    expect(game.calculate_score).to eq 135
    expect(game.frame_score.elements).to eq [30, 55, 75, 88, 93, 102, 110, 126, 132, 135]

    game.record_pins(2)
    expect(game.frames.length).to eq 10
    expect(game.calculate_score).to eq 137
    expect(game.frame_score.elements).to eq [30, 55, 75, 88, 93, 102, 110, 126, 132, 137]
  end

  it "records score and generate frames accurately after each score" do
    game.record_pins(10)
    expect(game.frames.length).to eq 1
    expect(game.calculate_score).to eq 10
    expect(game.frame_score.elements).to eq [10]

    game.record_pins(10)
    expect(game.frames.length).to eq 2
    expect(game.calculate_score).to eq 20
    expect(game.frame_score.elements).to eq [10, 20]

    game.record_pins(10)
    expect(game.frames.length).to eq 3
    expect(game.calculate_score).to eq 50
    expect(game.frame_score.elements).to eq [30, 40, 50]

    game.record_pins(5)
    expect(game.frames.length).to eq 4
    expect(game.calculate_score).to eq 70
    expect(game.frame_score.elements).to eq [30, 55, 65, 70]

    game.record_pins(5)
    expect(game.frames.length).to eq 4
    expect(game.calculate_score).to eq 75
    expect(game.frame_score.elements).to eq [30, 55, 65, 75]

    game.record_pins(3)
    expect(game.frames.length).to eq 5
    expect(game.calculate_score).to eq 91
    expect(game.frame_score.elements).to eq [30, 55, 75, 88, 91]

    game.record_pins(2)
    expect(game.frames.length).to eq 5
    expect(game.calculate_score).to eq 93
    expect(game.frame_score.elements).to eq [30, 55, 75, 88, 93]

    game.record_pins(8)
    expect(game.frames.length).to eq 6
    expect(game.calculate_score).to eq 101
    expect(game.frame_score.elements).to eq [30, 55, 75, 88, 93, 101]

    game.record_pins(1)
    expect(game.frames.length).to eq 6
    expect(game.calculate_score).to eq 102
    expect(game.frame_score.elements).to eq [30, 55, 75, 88, 93, 102]

    game.record_pins(3)
    expect(game.frames.length).to eq 7
    expect(game.calculate_score).to eq 105
    expect(game.frame_score.elements).to eq [30, 55, 75, 88, 93, 102, 105]

    game.record_pins(5)
    expect(game.frames.length).to eq 7
    expect(game.calculate_score).to eq 110
    expect(game.frame_score.elements).to eq [30, 55, 75, 88, 93, 102, 110]

    game.record_pins(4)
    expect(game.frames.length).to eq 8
    expect(game.calculate_score).to eq 114
    expect(game.frame_score.elements).to eq [30, 55, 75, 88, 93, 102, 110, 114]

    game.record_pins(2)
    expect(game.frames.length).to eq 8
    expect(game.calculate_score).to eq 116
    expect(game.frame_score.elements).to eq [30, 55, 75, 88, 93, 102, 110, 116]

    game.record_pins(10)
    expect(game.frames.length).to eq 9
    expect(game.calculate_score).to eq 126
    expect(game.frame_score.elements).to eq [30, 55, 75, 88, 93, 102, 110, 116, 126]

    game.record_pins(3)
    expect(game.frames.length).to eq 10
    expect(game.calculate_score).to eq 129
    expect(game.frame_score.elements).to eq [30, 55, 75, 88, 93, 102, 110, 116, 126, 129]

    game.record_pins(2)
    expect(game.frames.length).to eq 10
    expect(game.calculate_score).to eq 136
    expect(game.frame_score.elements).to eq [30, 55, 75, 88, 93, 102, 110, 116, 131, 136]
  end

  it "records all strikes" do
    12.times do
      game.record_pins(10)
      game.calculate_score
    end

    expect(game.frames.length).to eq 12
    expect(game.calculate_score).to eq 300
    expect(game.frame_score.elements).to eq [30, 60, 90, 120, 150, 180, 210, 240, 270, 300]
  end

  it "will not record strikes beyond 12 frames" do
    13.times do
      game.record_pins(10)
      game.calculate_score
    end

    expect(game.frames.length).to eq 12
    expect(game.calculate_score).to eq 300
    expect(game.frame_score.elements).to eq [30, 60, 90, 120, 150, 180, 210, 240, 270, 300]
  end

  it "records all spares" do
    21.times do
      game.record_pins(5)
      game.calculate_score
    end

    expect(game.frames.length).to eq 11
    expect(game.calculate_score).to eq 150
    expect(game.frame_score.elements).to eq [15, 30, 45, 60, 75, 90, 105, 120, 135, 150]
  end

  it "records strikes and end with a spare" do
    10.times do
      game.record_pins(10)
      game.calculate_score
    end
    game.record_pins(5)
    game.calculate_score
    game.record_pins(5)
    game.calculate_score

    expect(game.frames.length).to eq 11
    expect(game.calculate_score).to eq 285
    expect(game.frame_score.elements).to eq [30, 60, 90, 120, 150, 180, 210, 240, 265, 285]
  end
end
