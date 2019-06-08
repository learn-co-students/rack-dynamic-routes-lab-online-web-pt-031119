class Application

    @@items = []

    def call(env)
        resp = Rack::Response.new
        req = Rack::Request.new(env)
#binding.pry
        if req.path.match(/items/)  
            name = req.path.split("/").last
            item = @@items.find {|item| name == item.name}
            if item
                resp.write item.price
                resp.status = 200
            else
                resp.write "Item not found"
                resp.status = 400
            end 

        else
            resp.write "Route not found"
            resp.status = 404
        end

        resp.finish
    end
    
    
end 


    