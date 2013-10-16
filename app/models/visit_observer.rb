class VisitObserver < ActiveRecord::Observer
  observe :visit

  def after_create(visit)
    client = Faye::Client.new('http://localhost:9292/faye')
    client.publish '/visit', {
        model: visit.to_json,
        action:'create'
    }
  end

  def after_update(visit)
    client = Faye::Client.new('http://localhost:9292/faye')
    client.publish '/visit', {
        model: visit.to_json,
        action:'update'
    }
  end

  def after_destroy(visit)
    client = Faye::Client.new('http://localhost:9292/faye')
    client.publish '/visit', {
        model: visit.to_json,
        action:'destroy'
    }
  end
end
