class Application

    @@item = []

    def call(env)
        resp = Rack::Response.new
        req = Rack::Request.new(env)

        if req.path.match("/search")
            search_term = req.params["q"]
            resp.write handle_search(search_term)
            resp.status = 200
        else
            resp.write "Item Not found"
            resp.status = 400
        end 

        if req.path == "/items"
            resp.write "You requested items"
        else
            resp.write "Route not found"
            resp.status = 404
        end

        resp.finish
    end
    
    def handle_search(search_term)
        if @@item.include?(search_term)
            return "#{search_term.price}"
          else
            return "Couldn't find #{search_term}"
          end
        end
end 