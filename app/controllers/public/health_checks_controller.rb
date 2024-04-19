class Public::HealthChecksController < Public::ApplicationController
  def index
    head :ok
  end
end
