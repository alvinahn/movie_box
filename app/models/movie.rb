class Movie < ActiveRecord::Base

  has_many :reviews, dependent: :destroy

  validates :title, presence: true
  validates :director, presence: true
  validates :runtime_in_minutes, numericality: { only_integer: true }
  validates :description, presence: true
  validates :poster_image_url, presence: true
  validates :release_date, presence: true
  validate :release_date_is_in_the_past

  mount_uploader :poster, PosterUploader

  scope :runtime_less_than, ->(time) { where("runtime_in_minutes < ?", time)}
  scope :runtime_between, ->(time1, time2) { where("runtime_in_minutes >= ? and runtime_in_minutes <= ?", time1, time2)}
  scope :runtime_more_than, ->(time) { where("runtime_in_minutes > ?", time)}
  scope :search, ->(keyword) { where("title like ? or director like ?", keyword, keyword)}

  def review_average
    reviews.sum(:rating_out_of_ten)/reviews.size
  end

  protected

  def release_date_is_in_the_past
    if release_date.present?
      errors.add(:release_date, "should be in the past") if release_date > Date.today
    end
  end

end
