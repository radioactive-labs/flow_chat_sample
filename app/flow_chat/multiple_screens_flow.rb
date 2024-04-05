class MultipleScreensFlow < FlowChat::Flow
  def main_page
    name = app.screen(:name) { |prompt|
      prompt.ask "What is your name?", transform: ->(input) { input.squish }
    }

    age = app.screen(:age) do |prompt|
      prompt.ask "How old are you?",
        convert: ->(input) { input.to_i },
        validate: ->(input) { "You must be at least 13 years old" unless input >= 13 }
    end

    gender = app.screen(:gender) { |prompt| prompt.select "What is your gender", ["Male", "Female"] }

    confirm = app.screen(:confirm) do |prompt|
      prompt.yes?("Is this correct?\n\nName: #{name}\nAge: #{age}\nGender: #{gender}")
    end

    app.say confirm ? "Thank you for confirming" : "Please try again"
  end
end
