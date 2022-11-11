//
//  DBHelper.swift
//  DataTests
//
//  Created by cheonsong on 2022/11/11.
//

import Foundation
import RealmSwift
import RxSwift
import Util

struct DBHelper<Q: Object> {
    private var realm: Realm!
    
    init() {
        self.realm = try! Realm()
    }

    func add(_ object: Q)-> Single<Q> {
        return .create(subscribe: { single-> Disposable in
            do {
                try realm.write {
                    realm.add(object)
                }
                
                single(.success(object))
                
                return Disposables.create()
                
            } catch {
                return single(.failure(error)) as! Disposable
            }
        })
    }
    
    func update(_ object: Q)-> Single<Q> {
        return .create(subscribe: { single-> Disposable in
            do {
                try realm.write {
                    realm.add(object, update: .modified)
                }
                
                single(.success(object))
                
                return Disposables.create()
                
            } catch {
                return single(.failure(error)) as! Disposable
            }
        })
    }

    func delete(_ object: Q)-> Single<Void> {
        return .create(subscribe: { single-> Disposable in
            do {
                try realm.write {
                    realm.delete(object)
                }
                
                single(.success(()))
                
                return Disposables.create()
                
            } catch {
                return single(.failure(error)) as! Disposable
            }
        })
    }
    
    func deleteAll()-> Single<Void> {
        return .create(subscribe: { single-> Disposable in
            do {
                try realm.write {
                    realm.deleteAll()
                }
                
                single(.success(()))
                
                return Disposables.create()
                
            } catch {
                return single(.failure(error)) as! Disposable
            }
        })
    }

    func read()-> Single<[Q]> {
        let objects = realm!.objects(Q.self)
        
        return .create(subscribe: { single-> Disposable in
            single(.success(Array(objects)))
            
            return Disposables.create()
        })
    }
    
    func readWithQuery(query: @escaping (Query<Q>)-> Query<Bool>)-> Single<[Q]> {
        return .create(subscribe: { single-> Disposable in
            let objects = realm.objects(Q.self).where(query)
            single(.success(Array(objects)))
            
            return Disposables.create()
        })
    }

}
