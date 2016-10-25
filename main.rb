class Controller

  def call(env)
    action
    [200, {}, [@response_text]]
  end
end

class Router

    def initialize(routes)
      @routes = routes
    end
    def call(env)
      if @routes[env['PATH_INFO']].nil?
        [404, {}, ['not_found']]
      else
        @routes[env['PATH_INFO']].new.call(env)
      end
    end


end
