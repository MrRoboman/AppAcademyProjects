class CatRentalRequest < ActiveRecord::Base
  validates :status, inclusion: ["PENDING", "APPROVED", "DENIED"], presence: true

  belongs_to :cat

  def all_requests
    CatRentalRequest.all
  end

  def overlapping_requests
    all_request.select do |request|
      if request.cat_id == self.cat_id
        false
      elsif request.start_date.between?(self.start_date, self.end_date)
        true
      elsif request.end_date.between?(self.start_date, self.end_date)
        true
      end
    end
  end

  def overlapping_approved_requests
    overlapping_requests.select { |request| request.status == "APPROVED" }
  end
end
