class UssdDemoController < ApplicationController
  skip_forgery_protection

  def hello_world
    ussd_processor.run DemoFlow, :main_page
  end

  private

  def ussd_processor
    @ussd_processor ||= FlowChat::Ussd::Processor.new(self) do |processor|
      processor.use_gateway FlowChat::Ussd::Gateway::Nalo
      processor.use_session_store FlowChat::Session::RailsSessionStore
    end
  end
end
