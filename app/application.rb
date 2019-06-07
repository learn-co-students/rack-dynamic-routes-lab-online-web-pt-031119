class Application

    @@items = []

    def call(env)
        resp = Rack::Response.new
        req = Rack::Request.new(env)

        if req.path.match(/items/)
            if req.path == "/items"
                resp.write "You requested items"
            else
                resp.write "Route not found"
                resp.status = 404
            end
        end 

        resp.finish
    end 
end 