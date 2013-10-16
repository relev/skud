class WelcomeController < ApplicationController

  def index
    start_visit()
  end

  def start_visit
    client = Faye::Client.new 'http://localhost:9292/faye'
    client.publish '/visit_start', {action:'start'}
  end

  def close_visit
    client = Faye::Client.new 'http://localhost:9292/faye'
    client.publish '/visit_close', {action:'close'}
  end
end
