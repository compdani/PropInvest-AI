//
//  Property.swift
//  PropInvest AI
//
//  Created by Danilo Urrutia on 2/9/26.
//
import Foundation

struct Property: Identifiable {
    var id: String
    var title: String
    var address: String
    var city: String
    var state: String
    var zip: String
    var bed: String
    var bath: Float
    var price: Float
    var type: String
    var land: Int64
    var floor: Int64
    var level: Int16
    var description: String
    var location: Location
    var pics: Array<String>
    var main_pic: String
}

struct Location {
    var lon: Float
    var lat: Float
}
