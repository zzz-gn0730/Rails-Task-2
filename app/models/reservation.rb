class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :room

  validates :check_in, :check_out, :num, presence: true
  validates :num, numericality: { greater_than_or_equal_to: 1 }
  validate :validate_check_in_date
  validate :validate_check_out_date

  def stay_days
    if check_in.present? && check_out.present?
      (check_out - check_in).to_i
    else
      0
    end
  end

  def total_fee
    fee = room.fee || 0
    stay_days = self.stay_days || 0
    num = self.num || 0
    stay_days * fee * num
  end

  mount_uploader :avatar, AvatarUploader

  private

  def validate_check_in_date
    errors.add(:check_in, "cannot be in the past") if check_in.present? && check_in < Date.today
  end

  def validate_check_out_date
    errors.add(:check_out, "must be after check in date") if check_out.present? && check_out && check_in.present? && check_out <= check_in
  end
end
