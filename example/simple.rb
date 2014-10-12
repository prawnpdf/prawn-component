require_relative "example_helper"

Prawn::Component.define(:greetings) do
  text "Seasons greetings, #{params[:name]}!", :size => 24
end

Prawn::Document.generate("x.pdf") do
  draw :greetings, :name => "Matz", :box => [0, 0, 300, 30],
end
