require 'sinatra'

# Route for the homepage
get '/' do
  erb :index, locals: { result: "", transaction_id: nil }
end

# Route for handling the form submission
post '/calculate' do
  expression = params[:result].strip

  # Handling evaluation and basic error checking
  begin
    # Use eval to calculate the result safely
    result = eval(expression)
    transaction_id = rand(100000..999999)  # Random transaction ID

    erb :index, locals: { result: result, transaction_id: transaction_id }
  rescue => e
    # Handle any errors, like invalid math expression
    erb :index, locals: { result: "Invalid operation", transaction_id: nil }
  end
end
