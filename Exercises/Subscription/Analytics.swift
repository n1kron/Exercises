//
//  Analytics.swift
//
//

import Foundation
import YandexMobileMetrica
import FacebookCore

struct Analytics {
    static func logPurchaseScreenView(index: Int) {
        let params: [String: Any] = ["Номер": index]
        YMMYandexMetrica.reportEvent("Просмотр экрана подписки", parameters: params, onFailure: nil)
        
        let fbParams = AppEvent.ParametersDictionary(dictionaryLiteral: ("Index", index))
        AppEventsLogger.log("Purchase screen view", parameters: fbParams, valueToSum: nil, accessToken: nil)
    }
    
    static func logPurchase(productName: String, price: NSDecimalNumber, currency: String) {
        let realPrice = price.doubleValue * 0.6
        let params: [String: Any] = ["Товар": productName, "Цена": "\(realPrice)", "Валюта": currency]
        
        YMMYandexMetrica.reportEvent("Покупка", parameters: params, onFailure: nil)

        AppEventsLogger.log(.purchased(amount: realPrice, currency: currency, extraParameters: ["Product": productName]))
    }
}

