//
//  SocketManager.swift
//  WRMessenger
//
//  Created by Fedor Tikhonov on 25.05.2018.
//  Copyright © 2018 Iseck. All rights reserved.
//

import Foundation
import Starscream
import RxStarscream

class SocketManager: NSObject, WebSocketDelegate {
    var socket: WebSocket!
    
    override init() {
        super.init()
        
        self.socket = WebSocket(request: URLRequest(url: URL(string: Remote.serverSocketUrl)!))
        self.socket.delegate = self
        print("TRYING TO CONNECT")
        self.socket.connect()
        print("DONE TRYING")
    }
    
    func websocketDidConnect(socket: WebSocketClient) {
        print("websocket is connected")
    }
    
    func websocketDidDisconnect(socket: WebSocketClient, error: Error?) {
        print("websocket is disconnected: \(String(describing: error?.localizedDescription))")
    }
    
    func websocketDidReceiveMessage(socket: WebSocketClient, text: String) {
        print("Received text: \(text)")
    }
    
    func websocketDidReceiveData(socket: WebSocketClient, data: Data) {
        print("Received data: \(data.count)")
    }
    
    func sendMessage(_ message: String) {
        socket.write(string: message)
    }
    
    func sendData(_ data: Data) {
        socket.write(data: data)
    }
}
