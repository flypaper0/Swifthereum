//
//  EndpointTest.swift
//  UnitTests
//
//  Created by Ronald Mannak on 10/24/17.
//  Copyright © 2017 Indisputable Labs. All rights reserved.
//

import Foundation
import XCTest
import Swifthereum
@testable import Unit


// Testing if URL endpoints and parameters are passed correctly

class EndpointTest: XCTestCase {
    
    var server: Server!
    struct UnexpectedNilError: Error {}
    
    override func setUp() {
        super.setUp()
        server = Server()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    /*
    // web3 calls
    func testClientVersion() throws { try endpoint(for: .clientVersion) }
    func testSha3() throws { try endpoint(for: .sha3("0x68656c6c6f20776f726c64")) }
    
    // Net calls
    func testNetworkdID() throws { try endpoint(for: .networkID) }
    func testPeerCount() throws { try endpoint(for: .peerCount) }
    func testListening() throws { try endpoint(for: .listening) }
    
    // Ethereum calls
    func testProtocolVersion() throws { try endpoint(for: .protocolVersion) }
    func testIsSyncing() throws { try endpoint(for: .isSyncing) }
    func testCoinbase() throws { try endpoint(for: .coinbase) }
    func testIsMining() throws { try endpoint(for: .isMining) }
    func testHashrate() throws { try endpoint(for: .hashrate) }
    func testGasPrice() throws { try endpoint(for: .gasPrice) }
    func testAccounts() throws { try endpoint(for: .accounts) }
    func testBlockNumber() throws { try endpoint(for: .blockNumber) }
    func testBalance() throws { try endpoint(for: .balance(Address(hex: "0x407d73d8a49eeb85d32cf465507dd71d507100c1")!, .latest)) }
    
    func testTransactionCount() throws { try endpoint(for: .transactionCount(Address(hex: "0x407d73d8a49eeb85d32cf465507dd71d507100c1")!, .latest)) }
    func testBlockTransactionCount() throws { try endpoint(for: .blockTransactionCount(BlockHash(hex: "0xb903239f8543d04b5dc1ba6579132b143087c68db1b2168786408fcbce568238")!)) }
    */
    
    /*
        /*
        
        case .blockTransactionCount(_): return """
        {"id":1,"jsonrpc":"2.0","result":"0xb"}
        """
        case .blockTransactionCountByNumber(_): return """
        {"id":1,"jsonrpc":"2.0","result":"0xa"}
        """
        case .uncleCount(_): return """
        {"id":1,"jsonrpc":"2.0","result":"0x1"}
        """
        case .uncleCountByBlockNumber(_): return """
        {"id":1,"jsonrpc":"2.0","result":"0x1"}
        """
        case .code(_, _): return """
        {"id":1,"jsonrpc":"2.0","result": "0x600160008035811a818181146012578301005b601b6001356025565b8060005260206000f25b600060078202905091905056"}
        """
        case .sign(_, _): return """
        {"id":1,"jsonrpc":"2.0","result": "0xa3f20717a250c2b0b729b7e5becbff67fdaef7e0699da4de7ca5895b02a170a12d887fd3b17bfdce3481f10bea41f45ba9f709d39ce8325427b57afcfc994cee1b"}
        """
        case .sendTransaction(_): return """
        {"id":1,"jsonrpc":"2.0","result":"0xe670ec64341771606e55d6b4ca35a1a6b75ee3d5145a99d05921026d1527331"}
        """
        case .sendRawTransaction(_): return """
        {"id":1,"jsonrpc":"2.0","result":"0xe670ec64341771606e55d6b4ca35a1a6b75ee3d5145a99d05921026d1527331"}
        """
        case .call(_): return """
        {"id":1,"jsonrpc":"2.0","result":"0x"}
        """
        case .estimateGas(_): return """
        {"id":1,"jsonrpc":"2.0","result":"0x5208"}
        """
        case .blockByHash(_): return """
        {"id":1,"jsonrpc":"2.0","result": {"number": "0x1b4","hash": "0xe670ec64341771606e55d6b4ca35a1a6b75ee3d5145a99d05921026d1527331","parentHash":"0x9646252be9520f6e71339a8df9c55e4d7619deeb018d2a3f2d21fc165dde5eb5","nonce":"0xe04d296d2460cfb8472af2c5fd05b5a214109c25688d3704aed5484f9a7792f2","sha3Uncles":"0x1dcc4de8dec75d7aab85b567b6ccd41ad312451b948a7413f0a142fd40d49347","logsBloom":"0xe670ec64341771606e55d6b4ca35a1a6b75ee3d5145a99d05921026d1527331","transactionsRoot":"0x56e81f171bcc55a6ff8345e692c0f86e5b48e01b996cadc001622fb5e363b421","stateRoot":"0xd5855eb08b3387c0af375e9cdb6acfc05eb8f519e419b874b6ff2ffda7ed1dff","miner":"0x4e65fda2159562a496f9f3522f89122a3088497a","difficulty":"0x027f07","totalDifficulty":"0x027f07","extraData":"0x0000000000000000000000000000000000000000000000000000000000000000","size":"0x027f07","gasLimit": "0x9f759","gasUsed": "0x9f759","timestamp": "0x54e34e8e","transactions":[{...},{ ... }],"uncles": ["0x1606e5...", "0xd5145a9..."]}}
        """
        case .blockByNumber(_): return """
        """
        case .transaction(_): return """
        """
        case .transactionByBlockHashAndIndex(_, _): return """
        """
        case .transactionByBlockNumberAndIndex(_, _): return """
        """
        case .receipt(_): return """
        """
        case .uncleByBlockHashAndIndex(_, _): return """
        """
        case .uncleByBlockNumberAndIndex(_, _): return """
        """
         */
        try endpoint(for: .compilers)
        
        /*
        case .compileSolidity(_): return """
        """
        case .compileLLL(_): return """
        """
        case .compileSerpent(_): return """
        """
        case .notification(_): return """
        """*/
        
        try endpoint(for: .newBlockNotification)
        try endpoint(for: .newPendingTransactionNotification)
        
        /*
        
        case .uninstallNotification(_): return """
        """
        case .notificationChanges(_): return """
        """
        case .notificationLogs(_): return """
        """
        case .logs(_): return """
         */
        
        try endpoint(for: .work)
        /*
        
        
        case .submitWork(_): return """
        """
        case .submitHashrate(_, _): return """
        """
        case .putString(_, _, _): return """
        """
        case .getString(_, _): return """
        """
        case .putHex(_, _, _): return """
        """
        case .getHex(_, _): return """
        """ */
    }
    */
    
    // SSH Tests
    /*
    func testSshPost() throws {
        print("04f96a5e25610293e42a73908e93ccc8c4d4dc0edcfa9fa872f50cb214e08ebf61a03e245533f97284d442460f2998cd41858798ddfd4d661997d3940272b717b1".count)
        let to = WhisperAddress(hex: "0x04f96a5e25610293e42a73908e93ccc8c4d4dc0edcfa9fa872f50cb214e08ebf61a03e245533f97284d442460f2998cd41858798ddfd4d661997d3940272b717b1")
        XCTAssertNotNil(to)
        let from = WhisperAddress(hex: "0x3e245533f97284d442460f2998cd41858798ddf04f96a5e25610293e42a73908e93ccc8c4d4dc0edcfa9fa872f50cb214e08ebf61a0d4d661997d3940272b717b1")
        XCTAssertNotNil(from)
        let topic1 = Hash(hex: "0x776869737065722d636861742d636c69656e74")
        XCTAssertNotNil(topic1)
        let topic2 = Hash(hex: "0x4d5a695276454c39425154466b61693532")
        XCTAssertNotNil(topic2)
        let payload = Hash(hex: "0x7b2274797065223a226d6")
        XCTAssertNotNil(payload)
        
        let post = WhisperPost(from: to!,
                               to: from!,
                               topics: [topic1!, topic2!],
                               payload: payload!,
                               priority: 100,
                               ttl: 100)
        try endpoint(for: .sshPost(post))
    } */            
    /*
    func testSshVersion() throws { try endpoint(for: .sshVersion) }
    func testSshNewIdentity() throws { try endpoint(for: .sshNewIdentity) }
    func testSshHasIdentity() throws { try endpoint(for: .sshHasIdentity) }
    func testSshNewGroup() throws { try endpoint(for: .sshNewGroup) }
    func testSshAddToGroup() throws { try endpoint(for: .sshAddToGroup) }
    func testSshNewFilter() throws { try endpoint(for: .sshNewFilter) }
    func testSshUninstallFilter() throws { try endpoint(for: .sshUninstallFilter(7)) }
    func testSshGetFilterChanges() throws { try endpoint(for: .sshGetFilterChanges) }
    func testSshGetMessages() throws { try endpoint(for: .sshGetMessages) }
    */
    
    // test if error in a parameter dictionary is detected
    func testSanity() throws {
        
        let invalidParameterString = """
        {"jsonrpc":"2.0","method":"web3_invalidMethod","params":[],"id":67}
        """
        let invalidParameterString2 = """
        {"jsonrpc":"3.0","method":"web3_clientVersion","params":[],"id":67}
        """
        let invalidParameterString3 = """
        {"jsonrpc":"2.0","method":"web3_clientVersion","params":["invalidParameter"],"id":67}
        """        
        let validParameterString = """
        {"jsonrpc":"2.0","method":"web3_clientVersion","params":[],"id":2}
        """
        
        let invalid1 = try JSONDecoder().decode(Parameter.self, from: invalidParameterString.data(using: .utf8)!)
        let invalid2 = try JSONDecoder().decode(Parameter.self, from: invalidParameterString2.data(using: .utf8)!)
        let invalid3 = try JSONDecoder().decode(Parameter.self, from: invalidParameterString3.data(using: .utf8)!)
        let valid = try JSONDecoder().decode(Parameter.self, from: validParameterString.data(using: .utf8)!)
        
        let resource = Resource<Web3Result<String>>(server: server, method: .clientVersion)
        let urlRequest = try URLRequest(resource: resource)
        
        // Decode body parameters and expected body parameters as Parameter struct so we can compare both
        guard let bodyData = urlRequest.httpBody else { throw UnexpectedNilError() }
        let body = try JSONDecoder().decode(Parameter.self, from: bodyData)
        
        XCTAssertNotEqual(invalid1, body, "1: \(invalid1) is equal to \(body)")
        XCTAssertNotEqual(invalid2, body, "2: \(invalid2) is equal to \(body)")
        XCTAssertNotEqual(invalid3, body, "3: \(invalid3) is equal to \(body)")
        XCTAssertEqual(valid, body, "4: \(valid) is not equal to \(body)")
    }
    
    func endpoint(for method: NetworkMethod) throws {
        let resource = Resource<Web3Result<String>>(server: server, method: method)
        let urlRequest = try URLRequest(resource: resource)
        
        // Decode body parameters and expected body parameters as Parameter struct so we can compare both
        guard let bodyData = urlRequest.httpBody else { throw UnexpectedNilError() }
        print(String(data:bodyData, encoding: .utf8)!)
        let body = try JSONDecoder().decode(Parameter.self, from: bodyData)
        
        guard let expectedData = method.expectedBody.data(using: .utf8) else { throw UnexpectedNilError() }
        let expectedBody = try JSONDecoder().decode(Parameter.self, from: expectedData)
        
        XCTAssertEqual(urlRequest.httpMethod, method.expectedHttpMethod, "httpMethod for \(String(describing: method)) is \(urlRequest.httpMethod ?? "nil")")
        XCTAssertEqual(urlRequest.url, URL(string: "http://localhost:8545"), "url for \(String(describing: method)) is \(String(describing: urlRequest.url))")
        let delta = body ∆ expectedBody
        XCTAssertNil(delta)
        XCTAssertEqual(body, expectedBody, "\(delta ?? "")")
    }
}








