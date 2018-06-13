require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry' )
require_relative("./models/pizza_order.rb")
also_reload("./models/*")

# INDEX
get "/pizza-orders" do
  @orders = PizzaOrder.all()
  erb(:index)
end

#CREATE
post "/pizza-orders" do
  @order = PizzaOrder.new(params)
  @order.save()
  erb(:create)
end

#NEW
get "/pizza-orders/new" do
  erb(:new)
end

#SHOW
get "/pizza-orders/:id" do
  id = params[:id].to_i()
  @order = PizzaOrder.find(id)
  erb(:show)
end