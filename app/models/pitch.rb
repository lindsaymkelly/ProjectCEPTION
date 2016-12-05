class Pitch < ApplicationRecord

  validates_presence_of :title, :body, :student_id
  validates_uniqueness_of :title
  validates :title, length: { minimum: 3 }
  validates :body, length: { minimum: 20 }

  belongs_to :student, class_name: User
  has_many :votes
  has_many :voters, through: :votes, source: :student
  has_one :final_group
  has_many :pitch_rankings
  has_many :rankers, through: :pitch_rankings, source: :student
  has_many :final_group_members, through: :final_group, source: :student

  def vote_count
    self.votes.count
  end

  def total_ranking
    self.pitch_rankings.sum(:ranking)
  end

end
