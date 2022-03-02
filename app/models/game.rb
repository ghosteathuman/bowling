class Game < ApplicationRecord
  has_many :frames

  kredis_integer :total_score
  kredis_list :frame_score, typed: :integer

  def record_pins(number_of_pins)
    if frames.length < 10 || frames.length == 10 && !frames.last&.finished? || frames.length == 10 && frames.last&.strike? || frames.length == 10 && frames.last&.spare?
      current_frame.insert_score(number_of_pins)
    end
  end

  def calculate_score
    frames = self.frames.to_a
    frame_score.clear
    frames[0..10].each_with_index do |frame, index|
      calculate_strike(frame, index)
      calculate_spare(frame, index)
      frame_score << frame.score
    end
    total_score.value = frames[0..10].inject(0) { |sum, frame| sum + frame.score }
  end

  private

  def current_frame
    last_frame = frames.last
    if last_frame.nil? || last_frame.finished?
      frames.create
    else
      last_frame
    end
  end

  def calculate_strike(frame, index)
    return unless frame.strike?
    return if score_for_frame(index + 1).nil?
    return if score_for_frame(index + 2).nil? && index < 9

    frame.score += (score_for_frame(index + 1) || 0) + (score_for_frame(index + 2) || 0)
  end

  def calculate_spare(frame, index)
    return unless frame.spare?
    frame.score += (score_for_frame(index + 1) || 0)
  end

  def score_for_frame(index)
    frames[index]&.score
  end
end
