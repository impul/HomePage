import Vapor
import Foundation
import Dispatch

extension Droplet {
    func setupRoutes() throws {
        get("") { _ in
           return try self.view.make("HomePage/index.html")
        }
        
        socket("ws") { req, ws in
            print("New WebSocket connected: \(ws)")
            
            // ping the socket to keep it open
            try background {
                while ws.state == .open {
                    try? ws.ping()
                    self.console.wait(seconds: 10) // every 10 seconds
                }
            }
            
            ws.onText = { ws, text in
                print("Text received: \(text)")
                
                // reverse the characters and send back
                let rev = String(text.reversed())
                try ws.send(rev)
            }
            
            ws.onClose = { ws, code, reason, clean in
                print("Closed.")
            }
        }
        
        try resource("posts", PostController.self)
    }
}
