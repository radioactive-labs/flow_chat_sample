class HelloWorldFlow < FlowChat::Flow
  def main_page
    app.say "Hello World!"
  end
end
