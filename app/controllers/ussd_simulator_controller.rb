class UssdSimulatorController < ApplicationController
  include FlowChat::Ussd::Simulator::Controller

  protected

  def default_endpoint
    "/ussd_hello_world"
  end

  def default_provider
    :nalo
  end
end
