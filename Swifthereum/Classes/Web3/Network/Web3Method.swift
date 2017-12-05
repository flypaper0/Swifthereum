//
//  Web3Method.swift
//  Swifthereum
//
//  Created by Ronald Mannak on 10/19/17.
//

import Foundation

/**
 https://github.com/ethereum/wiki/wiki/JSON-RPC

 
 */
public enum Web3Method {
    
    // Web3
    case clientVersion
    case sha3(String) // TODO: Change to variable length Hash
    
    // Net
    case networkID
    case peerCount
    case listening
    
    // Ethereum
    case protocolVersion
    case isSyncing
    case coinbase
    case isMining
    case hashrate
    case gasPrice
    case accounts
    case blockNumber
    case balance(Address, DefaultBlock)
//    case storage(Address, DefaultBlock)
    case transactionCount(Address, DefaultBlock)
    case blockTransactionCount(BlockHash)
    case blockTransactionCountByNumber(DefaultBlock)
    case uncleCount(BlockHash)
    case uncleCountByBlockNumber(DefaultBlock)
    case code(Address, DefaultBlock)
    case sign(Address, Hash)
    case sendTransaction(NewTransaction)
    case sendRawTransaction(TransactionHash)
    case call(NewTransaction)
    case estimateGas(NewTransaction)
    case blockByHash(BlockHash)
    case blockByNumber(Int64)
    case transaction(TransactionHash)
    case transactionByBlockHashAndIndex(BlockHash, Int)
    case transactionByBlockNumberAndIndex(Int64, Int)
    case receipt(TransactionHash)
    case uncleByBlockHashAndIndex(BlockHash, Int)
    case uncleByBlockNumberAndIndex(Int, Int)
    case compilers
    case compileSolidity(String)
    case compileLLL(String)
    case compileSerpent(String)
    case notification(EthereumNotification)
    case newBlockNotification
    case newPendingTransactionNotification
    case uninstallNotification(Int64)
    case notificationChanges(Int64)
    case notificationLogs(Int64)
    case logs(EthereumNotification)
    case work
    case submitWork(Work)
    case submitHashrate(Bytes32Hash, Bytes32Hash)
    
    // DB
    case putString(String, String, String)
    case getString(String, String)
    case putHex(String, String, String)
    case getHex(String, String)
    
    // SSH
    case sshVersion
    case sshPost(WhisperPost)
    case sshNewIdentity
    case sshHasIdentity //(String)
    case sshNewGroup
    case sshAddToGroup //(String)
    case sshNewFilter // ()...
    case sshUninstallFilter(Int64)
    case sshGetFilterChanges // ()..
    case sshGetMessages // ()..
}

extension Web3Method {
    public var method: String {
        switch self {
        case .clientVersion:                    return "web3_clientVersion"
        case .sha3:                             return "web3_sha3"
        case .networkID:                        return "net_version"
        case .peerCount:                        return "net_peerCount"
        case .listening:                        return "net_listening"
        case .protocolVersion:                  return "eth_protocolVersion"
        case .isSyncing:                        return "eth_syncing"
        case .coinbase:                         return "eth_coinbase"
        case .isMining:                         return "eth_mining"
        case .hashrate:                         return "eth_hashrate"
        case .gasPrice:                         return "eth_gasPrice"
        case .accounts:                         return "eth_accounts"
        case .blockNumber:                      return "eth_blockNumber"
        case .balance:                          return "eth_getBalance"
//        case .storage:                          return "eth_getStorageAt"
        case .transactionCount:                 return "eth_getTransactionCount"
        case .blockTransactionCount:            return "eth_getBlockTransactionCountByHash"
        case .blockTransactionCountByNumber:    return "eth_getBlockTransactionCountByNumber"
        case .uncleCount:                       return "eth_getUncleCountByBlockHash"
        case .uncleCountByBlockNumber:          return "eth_getUncleCountByBlockNumber"
        case .code:                             return "eth_getCode"
        case .sign:                             return "eth_sign"
        case .sendTransaction:                  return "eth_sendTransaction"
        case .sendRawTransaction:               return "eth_sendRawTransaction"
        case .call:                             return "eth_call"
        case .estimateGas:                      return "eth_estimateGas"
        case .blockByHash:                      return "eth_getBlockByHash"
        case .blockByNumber:                    return "eth_getBlockByNumber"
        case .transaction:                      return "eth_getTransactionByHash"
        case .transactionByBlockHashAndIndex:   return "eth_getTransactionByBlockHashAndIndex"
        case .transactionByBlockNumberAndIndex: return "eth_getTransactionByBlockNumberAndIndex"
        case .receipt:                          return "eth_getTransactionReceipt"
        case .uncleByBlockHashAndIndex:         return "eth_getUncleByBlockHashAndIndex"
        case .uncleByBlockNumberAndIndex:       return "eth_getUncleByBlockNumberAndIndex"
        case .compilers:                        return "eth_getCompilers"
        case .compileSolidity:                  return "eth_compileSolidity"
        case .compileLLL:                       return "eth_compileLLL"
        case .compileSerpent:                   return "eth_compileSerpent"
        case .notification:                     return "eth_newFilter"
        case .newBlockNotification:             return "eth_newBlockFilter"
        case .newPendingTransactionNotification:return "eth_newPendingTransactionFilter"
        case .uninstallNotification:            return "eth_uninstallFilter"
        case .notificationChanges:              return "eth_getFilterChanges"
        case .notificationLogs:                 return "eth_getFilterLogs"
        case .logs:                             return "eth_getLogs"
        case .work:                             return "eth_getWork"
        case .submitWork:                       return "eth_submitWork"
        case .submitHashrate:                   return "eth_submitHashrate"
        case .putString:                        return "db_putString"
        case .getString:                        return "db_getString"
        case .putHex:                           return "db_putHex"
        case .getHex:                           return "db_getHex"
        case .sshVersion:                       return "shh_version"
        case .sshPost:                          return "shh_post"
        case .sshNewIdentity:                   return "shh_newIdentity"
        case .sshHasIdentity:                   return "shh_hasIdentity"
        case .sshNewGroup:                      return "shh_newGroup"
        case .sshAddToGroup:                    return "shh_addToGroup"
        case .sshNewFilter:                     return "shh_newFilter"
        case .sshUninstallFilter:               return "shh_uninstallFilter"
        case .sshGetFilterChanges:              return "shh_getFilterChanges"
        case .sshGetMessages:                   return "shh_getMessages"
        }
    }
}

extension Web3Method {
    
    /**
     Returns the JSON-RCP request in JSONDictionary format.
     
     E.g.: ```{"jsonrpc":"2.0","method":"web3_sha3","params":["0x68656c6c6f20776f726c64"],"id":64}```
     
     - parameter id:
        Value will be included in the returned RpcResponse. Used to distinguish requests.
     */
    public func requestDictionary(id: Int = 1) throws -> JSONDictionary {
        
        let rpcParams: RPCParameters
        
        switch self {
        case .sha3(let string):
            rpcParams = .byPosition([string])
            
        case .balance(let address, let defaultBlock):
            rpcParams = .byPosition([String(describing: address), defaultBlock.value])
            
//        case .storage(let address, let defaultBlock):
//            rpcParams = .byPosition([String(describing: address), defaultBlock.value])
        
        case .transactionCount(let address, let defaultBlock):
            rpcParams = .byPosition([String(describing: address), defaultBlock.value])

        case .blockTransactionCount(let blockHash):
            rpcParams = .byPosition([String(describing: blockHash)])
            
        case .blockTransactionCountByNumber(let defaultBlock):
            rpcParams = .byPosition([defaultBlock.value])
            
        case .uncleCount(let blockHash):
            rpcParams = .byPosition([String(describing: blockHash)])

        case .uncleCountByBlockNumber(let defaultBlock):
            rpcParams = .byPosition([defaultBlock.value])
            
        case .code(let address, let defaultBlock):
            rpcParams = .byPosition([String(describing: address), defaultBlock.value])
            
        case .sign(let address, let message):
            rpcParams = .byPosition([String(describing: address), String(describing: message)])
            
        case .sendTransaction(let transaction):
            let dict = try transaction.asDictionary()
            rpcParams = .byName(dict)

        case .transaction(let hash):
            rpcParams = .byPosition([String(describing: hash)])
            
        case .sshPost(let post):
            let dict = try post.asDictionary()
            rpcParams = .byName(dict)

        case .sshUninstallFilter(let filterID):
            rpcParams = .byPosition(["\(filterID.hexValue)"])
            
        default:
            rpcParams = .byPosition([])
        }
        
        // Create RPC Request and return the request as a dictionary
        let request = RPCRequest(method: method, params: rpcParams, id: id)
        let dict = request.dictionary
        return dict
    }
}

/*
case sendTransaction(NewTransaction)
case sendRawTransaction(TransactionHash)
case call(NewTransaction)
case estimateGas(NewTransaction)
case blockByHash(BlockHash)
case blockByNumber(Int64)
case transaction(TransactionHash)
case transactionByBlockHashAndIndex(BlockHash, Int)
case transactionByBlockNumberAndIndex(Int64, Int)
case receipt(TransactionHash)
case uncleByBlockHashAndIndex(BlockHash, Int)
case uncleByBlockNumberAndIndex(Int, Int)
case compilers
case compileSolidity(String)
case compileLLL(String)
case compileSerpent(String)
case notification(EthereumNotification)
case newBlockNotification
case newPendingTransactionNotification
case uninstallNotification(Int64)
case notificationChanges(Int64)
case notificationLogs(Int64)
case logs(EthereumNotification)
case work
case submitWork(Work)
case submitHashrate(Bytes32Hash, Bytes32Hash)
*/
