import Vapor

extension Droplet {
    func setupRoutes() throws {
        get("") { req in
           return try self.view.make("HomePage/index.html")
        }
        try resource("posts", PostController.self)
    }
}
