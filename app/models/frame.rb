class Frame < ApplicationRecord
  belongs_to :game

  validates :score, comparison: {less_than_or_equal_to: 30}

  def insert_score(score)
    update(score: self.score += score)
    update_frame_status
  end

  def strike?
    score == 10 && second_roll == false
  end

  def spare?
    score == 10 && second_roll == true
  end

  def finished?
    first_roll && second_roll || score >= 10
  end

  private

  def update_frame_status
    if first_roll == false
      update(first_roll: true)
    else
      update(second_roll: true)
    end
  end
end
