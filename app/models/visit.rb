class Visit < ActiveRecord::Base
  belongs_to :device
  belongs_to :user

  def to_state
    duration = (closed_at || Time.now).to_i - created_at.to_i
    duration /= 60
    price = duration < 60            \
        ? duration * 1.5             \
        : 90+(duration-60) -         \
           ((duration/120).to_i*20)

    res = {
      user: user,
      device: device,
      created_at: created_at,
      duration: duration,
      price: price,
    }
    res[:closed_at] = closed_at if closed_at
    res
  end
end

