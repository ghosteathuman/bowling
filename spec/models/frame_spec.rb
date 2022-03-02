require "rails_helper"

RSpec.describe Frame, type: :model do
  let(:frame) { create(:frame) }

  it "does not go beyond score of 30" do
    frame.insert_score(31)

    expect(frame).not_to be_valid
  end

  it "checks for strike accurately" do
    frame.insert_score(10)

    expect(frame).to be_valid
    expect(frame.strike?).to eq true
    expect(frame.spare?).to eq false
    expect(frame.finished?).to eq true
  end

  it "checks for spare accurately" do
    frame.insert_score(5)
    frame.insert_score(5)

    expect(frame).to be_valid
    expect(frame.strike?).to eq false
    expect(frame.spare?).to eq true
    expect(frame.finished?).to eq true
  end

  it "checks for finished frame accurately" do
    frame.insert_score(1)
    frame.insert_score(2)

    expect(frame).to be_valid
    expect(frame.finished?).to eq true
  end
end
