//
//  String.swift
//  desafio-carrefour
//
//  Created by Wellysson Avelar on 13/09/23.
//

import Foundation

extension String {
    func toDate(withFormat format: String = "yyyy-MM-dd'T'HH:mm:ssZ") -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "pt-BR")
        dateFormatter.calendar = Calendar(identifier: .gregorian)
        dateFormatter.dateFormat = format
        let date = dateFormatter.date(from: self)

        return date
    }
}

enum DateFormat: String {
    case ddMMyyyy = "dd/MM/yyyy"
    case yyyyMMddSlash = "yyyy/MM/dd"
    case yyyyMMddTTHHmmSSS = "yyyy-MM-dd'T'HH:mm:ss.SSS"
    case yyyyMMddTHHmmSSSZ = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
    case yyyyMMddTTHHmmss = "yyyy-MM-dd'T'HH:mm:ss"
    case yyyyMMddTTHHmm = "yyyy-MM-dd'T'HH:mm"
    case yyyyMMddTTHHmmDot = "yyyy-MM-dd'T'HH:mm:ss."
    case yyyyMMddTTHHmmSSSZ = "yyyy-MM-dd'T'HH:mm:ssZ"
    case yyyyMMdd = "yyyy-MM-dd"
    case ddMM = "dd/MM"
    case HHmm = "HH:mm"
    case Month = "MMMM"
    case YearMonth = "yyyy-MM"
    case ddMMMyySlash = "dd/MMM/yy"
    case ddMMMyyyySlash = "dd/MMM/yyyy"
    case ddMMM = "dd ** MMM"
    case ddSlashMMM = "d/MMM"
    case ddSlashMMMHHmm = "d/MMM 'às' H:mm"
    case ddSlashMMMHHmmDouble = "dd/MMM 'às' HH:mm"
    case ddSlashMMMHHmmDouble2 = "dd/MMM 'às' HH'h'mm"
    case ddSlashMMasHHmm = "dd/MM 'às' HH:mm"
    case ddMMYYYYasHHmmss = "dd/MM/yyyy 'às' HH:mm:ss"
    case HmmddMMMyyyyText = "'Válido até as' H:mm 'do dia' dd/MMM/yyyy'.'"
    case HhmmddMMyyyyText = "'Válido até as' HH'h'mm 'do dia' dd/MM/yyyy'.'"
    case yyyyMMddHHmmss = "yyyy-MM-dd HH:mm:ss"
    case dMMMMYYYYHHmm = "d 'de' MMMM 'de' YYYY 'às' HH:mm"
    case edMMM = "E, d 'de' MMM" // seg, 25 de mai
    case ddMMyyyyHHh = "dd/MM/yyyy '-' HH'h'"
    case ddMMyyyyHHhmm = "dd/MM/yyyy '-' HH'h'mm"
}
