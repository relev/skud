class UserObserver < ActiveRecord::Observer
  observe :user

  def after_create(user)
    client = Faye::Client.new('http://localhost:9292/faye')
    client.publish '/user', {model:user.to_json, action:'create'}
  end

  def after_update(user)
    client = Faye::Client.new('http://localhost:9292/faye')
    client.publish '/user', {model:user.to_json, action:'update'}
  end

  def after_destroy(user)
    client = Faye::Client.new('http://localhost:9292/faye')
    client.publish '/user', {model:user.to_json, action:'destroy'}
  end

end