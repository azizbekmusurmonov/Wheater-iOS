
import Foundation

struct MCountry: Codable {
    let name: Name?
    let tld: [String]?
    let cca2, ccn3, cca3, cioc: String?
    let independent: Bool?
    let status: Status?
    let unMember: Bool?
    let currencies: Currencies?
    let idd: Idd?
    let capital, altSpellings: [String]?
    let region: Region?
    let subregion: String?
    let languages: [String: String]?
    let translations: [String: Translation]?
    let latlng: [Double]?
    let landlocked: Bool?
    let area: Double?
    let demonyms: Demonyms?
    let flag: String?
    let maps: Maps?
    let population: Int?
    let gini: [String: Double]?
    let fifa: String?
    let car: Car?
    let timezones: [String]?
    let continents: [Continent]?
    let flags: Flags?
    let coatOfArms: CoatOfArms?
    let startOfWeek: StartOfWeek?
    let capitalInfo: CapitalInfo?
    let postalCode: PostalCode?
    let borders: [String]?
    
    
    
    var countryName: String {
        return self.name?.common ?? ""
    }
    
    var capitalName: String {
        return self.capital?.first ?? ""
    }
    
    var countryId: String {
        let name = self.name?.common ?? ""
        let capital = self.capital?.first ?? ""
        return (name + capital)
    }
}

// MARK: - CapitalInfo
struct CapitalInfo: Codable {
    let latlng: [Double]?
}

// MARK: - Car
struct Car: Codable {
    let signs: [String]?
    let side: Side?
}

enum Side: String, Codable {
    case sideLeft = "left"
    case sideRight = "right"
}

// MARK: - CoatOfArms
struct CoatOfArms: Codable {
    let png: String?
    let svg: String?
}

enum Continent: String, Codable {
    case africa = "Africa"
    case antarctica = "Antarctica"
    case asia = "Asia"
    case europe = "Europe"
    case northAmerica = "North America"
    case oceania = "Oceania"
    case southAmerica = "South America"
}

// MARK: - Currencies
struct Currencies: Codable {
    let eur, ern, lrd, bmd: Aed?
    let ckd, nzd, sos, zmw: Aed?
    let ves, tmt, all, gbp: Aed?
    let sdg: BAM?
    let usd, xaf, azn, kes: Aed?
    let xof, vnd, afn, gtq: Aed?
    let kwd, stn, kgs, pln: Aed?
    let ghs, amd, jep, xcd: Aed?
    let tjs, etb, dzd, mad: Aed?
    let mru, aud, bnd, sgd: Aed?
    let ron, nok, byn, pab: Aed?
    let czk, pkr, pen, bbd: Aed?
    let dkk, huf, kmf, bdt: Aed?
    let fjd, cny, cop, mvr: Aed?
    let myr, kyd, pyg, uyu: Aed?
    let zar, vuv, sek, lbp: Aed?
    let clp, bzd, gyd, mnt: Aed?
    let tvd, dop, bob, npr: Aed?
    let twd, bgn, mdl, imp: Aed?
    let btn, inr, khr, htg: Aed?
    let cve, gel, bif, bsd: Aed?
    let mur, lyd, mwk, mxn: Aed?
    let szl, pgk, chf, rub: Aed?
    let ils, ugx, top, aed: Aed?
    let srd, uzs, sar, egp: Aed?
    let mga, xpf, cad, gmd: Aed?
    let ttd, scr, jpy, brl: Aed?
    let syp, shp, tzs, irr: Aed?
    let krw, wst, jmd, nio: Aed?
    let gnf, php, nad, crc: Aed?
    let bam: BAM?
    let mop, mzn, kpw, uah: Aed?
    let iqd, aoa, sll, cuc: Aed?
    let cup, rsd, fok, jod: Aed?
    let currenciesTRY, kid, kzt, gip: Aed?
    let isk, qar, mmk, thb: Aed?
    let awg, ngn, bhd, lak: Aed?
    let djf, sbd, ang, fkp: Aed?
    let bwp, ggp, zwl, lsl: Aed?
    let ars, yer, cdf, omr: Aed?
    let idr, rwf, mkd, tnd: Aed?
    let ssp, hnl, lkr, hkd: Aed?

    enum CodingKeys: String, CodingKey {
        case eur = "EUR"
        case ern = "ERN"
        case lrd = "LRD"
        case bmd = "BMD"
        case ckd = "CKD"
        case nzd = "NZD"
        case sos = "SOS"
        case zmw = "ZMW"
        case ves = "VES"
        case tmt = "TMT"
        case all = "ALL"
        case gbp = "GBP"
        case sdg = "SDG"
        case usd = "USD"
        case xaf = "XAF"
        case azn = "AZN"
        case kes = "KES"
        case xof = "XOF"
        case vnd = "VND"
        case afn = "AFN"
        case gtq = "GTQ"
        case kwd = "KWD"
        case stn = "STN"
        case kgs = "KGS"
        case pln = "PLN"
        case ghs = "GHS"
        case amd = "AMD"
        case jep = "JEP"
        case xcd = "XCD"
        case tjs = "TJS"
        case etb = "ETB"
        case dzd = "DZD"
        case mad = "MAD"
        case mru = "MRU"
        case aud = "AUD"
        case bnd = "BND"
        case sgd = "SGD"
        case ron = "RON"
        case nok = "NOK"
        case byn = "BYN"
        case pab = "PAB"
        case czk = "CZK"
        case pkr = "PKR"
        case pen = "PEN"
        case bbd = "BBD"
        case dkk = "DKK"
        case huf = "HUF"
        case kmf = "KMF"
        case bdt = "BDT"
        case fjd = "FJD"
        case cny = "CNY"
        case cop = "COP"
        case mvr = "MVR"
        case myr = "MYR"
        case kyd = "KYD"
        case pyg = "PYG"
        case uyu = "UYU"
        case zar = "ZAR"
        case vuv = "VUV"
        case sek = "SEK"
        case lbp = "LBP"
        case clp = "CLP"
        case bzd = "BZD"
        case gyd = "GYD"
        case mnt = "MNT"
        case tvd = "TVD"
        case dop = "DOP"
        case bob = "BOB"
        case npr = "NPR"
        case twd = "TWD"
        case bgn = "BGN"
        case mdl = "MDL"
        case imp = "IMP"
        case btn = "BTN"
        case inr = "INR"
        case khr = "KHR"
        case htg = "HTG"
        case cve = "CVE"
        case gel = "GEL"
        case bif = "BIF"
        case bsd = "BSD"
        case mur = "MUR"
        case lyd = "LYD"
        case mwk = "MWK"
        case mxn = "MXN"
        case szl = "SZL"
        case pgk = "PGK"
        case chf = "CHF"
        case rub = "RUB"
        case ils = "ILS"
        case ugx = "UGX"
        case top = "TOP"
        case aed = "AED"
        case srd = "SRD"
        case uzs = "UZS"
        case sar = "SAR"
        case egp = "EGP"
        case mga = "MGA"
        case xpf = "XPF"
        case cad = "CAD"
        case gmd = "GMD"
        case ttd = "TTD"
        case scr = "SCR"
        case jpy = "JPY"
        case brl = "BRL"
        case syp = "SYP"
        case shp = "SHP"
        case tzs = "TZS"
        case irr = "IRR"
        case krw = "KRW"
        case wst = "WST"
        case jmd = "JMD"
        case nio = "NIO"
        case gnf = "GNF"
        case php = "PHP"
        case nad = "NAD"
        case crc = "CRC"
        case bam = "BAM"
        case mop = "MOP"
        case mzn = "MZN"
        case kpw = "KPW"
        case uah = "UAH"
        case iqd = "IQD"
        case aoa = "AOA"
        case sll = "SLL"
        case cuc = "CUC"
        case cup = "CUP"
        case rsd = "RSD"
        case fok = "FOK"
        case jod = "JOD"
        case currenciesTRY = "TRY"
        case kid = "KID"
        case kzt = "KZT"
        case gip = "GIP"
        case isk = "ISK"
        case qar = "QAR"
        case mmk = "MMK"
        case thb = "THB"
        case awg = "AWG"
        case ngn = "NGN"
        case bhd = "BHD"
        case lak = "LAK"
        case djf = "DJF"
        case sbd = "SBD"
        case ang = "ANG"
        case fkp = "FKP"
        case bwp = "BWP"
        case ggp = "GGP"
        case zwl = "ZWL"
        case lsl = "LSL"
        case ars = "ARS"
        case yer = "YER"
        case cdf = "CDF"
        case omr = "OMR"
        case idr = "IDR"
        case rwf = "RWF"
        case mkd = "MKD"
        case tnd = "TND"
        case ssp = "SSP"
        case hnl = "HNL"
        case lkr = "LKR"
        case hkd = "HKD"
    }
}

// MARK: - Aed
struct Aed: Codable {
    let name, symbol: String?
}

// MARK: - BAM
struct BAM: Codable {
    let name: String?
}

// MARK: - Demonyms
struct Demonyms: Codable {
    let eng, fra: Eng?
}

// MARK: - Eng
struct Eng: Codable {
    let f, m: String?
}

// MARK: - Flags
struct Flags: Codable {
    let png: String?
    let svg: String?
    let alt: String?
}

// MARK: - Idd
struct Idd: Codable {
    let root: String?
    let suffixes: [String]?
}

// MARK: - Maps
struct Maps: Codable {
    let googleMaps, openStreetMaps: String?
}

// MARK: - Name
struct Name: Codable {
    let common, official: String?
    let nativeName: [String: Translation]?
}

// MARK: - Translation
struct Translation: Codable {
    let official, common: String?
}

// MARK: - PostalCode
struct PostalCode: Codable {
    let format, regex: String?
}

enum Region: String, Codable {
    case africa = "Africa"
    case americas = "Americas"
    case antarctic = "Antarctic"
    case asia = "Asia"
    case europe = "Europe"
    case oceania = "Oceania"
}

enum StartOfWeek: String, Codable {
    case monday = "monday"
    case saturday = "saturday"
    case sunday = "sunday"
}

enum Status: String, Codable {
    case officiallyAssigned = "officially-assigned"
    case userAssigned = "user-assigned"
}

