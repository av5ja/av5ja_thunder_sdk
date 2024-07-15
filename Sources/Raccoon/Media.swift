//
//  Media.swift
//  Raccoon
//
//  Created by devonly on 2023/12/30
//  Copyright © 2023 Magi Corporation. All rights reserved.
//

import Foundation
import Thunder

/// StaticMedia from SplatNet 3
/// https://api.lp1.av5ja.srv.nintendo.net/static/css/main.21288b21.css
/// https://api.lp1.av5ja.srv.nintendo.net/static/js/main.06c4deaf.js
// swiftlint:disable:next type_body_length
public enum Media {
    public enum SP2 {
        public enum WOFF: String, StaticMedia {
            public var path: String {
                "fonts/bundled"
            }
            
            case Splatfont1 = "0e12b13c359d4803021dc4e17cecc311.woff2"
            case Splatfont2 = "eb82d017016045bf998cade4dac1ec22.woff2"
        }
        
        public enum PNG: RawRepresentable, StaticMedia {
            public typealias RawValue = String
            
            public var path: String {
                "images/bundled"
            }
            
            case GolenIkura
            //            case Ikura = "78f61aacb1fbb50f345cdf3016aa309e.png"
            case Ikura
            case Refresh
            case Rescue(Species)
            case Death(Species)
            
            public static let allCases: [Media.SP2.PNG] = [
                .Ikura,
                .GolenIkura,
                .Refresh,
                .Rescue(.Inkling),
                .Rescue(.Octoling),
                .Death(.Inkling),
                .Death(.Octoling),
            ]
            
            public var rawValue: String {
                switch self {
                case .GolenIkura:
                    return "3aa6fb4ec1534196ede450667c1183dc.png"
                case .Ikura:
                    return "efe826cfd1d44d19153f08e19f6caa2a.png"
                case .Refresh:
                    return "50732dded088309dfb8f436f3885e782.png"
                case .Rescue(let value):
                    switch value {
                    case .Inkling:
                        return "c003ffe0a5580e4c8b1bc9df1e0a30d2.png"
                    default:
                        return "76f0143bbd579054410f1de8445f9dd4.png"
                    }
                case .Death(let value):
                    switch value {
                    case .Inkling:
                        return "5d447dcfcb3b0c31ffb2efca58a6e799.png"
                    default:
                        return "fa7045022d3183caac60f7f129bce8ec.png"
                    }
                }
            }
        }
    }
    
    // swiftlint:disable:next type_body_length
    public enum SP3 {
        public enum JPG: String, StaticMedia {
            case BattleHistoryHeader = "battle-history-header.jpg"
            case Visual = "visual.jpg"
        }
        
        // swiftlint:disable:next type_body_length
        public enum SVG: StaticMedia {
            public typealias RawValue = String
            
            case Album
            case Area
            case Arrow
            case Asari
            case Atama
            case Bankara
            case Battle
            case BattleOn
            case BigRun
            case Boss
            case Buki
            case Catalog
            case Challenge
            case Coop
            case CoopOn
            case Event
            case Fest
            case Fuku
            case Gesotown
            case GesotownCoin
            case GesotownItemBg
            case GoldIkura
            case HelpedOcto
            case HelpedSquid
            case Hero
            case Himedrone
            case History
            case Hoko
            case HolpenOcto
            case HolpenSquid
            case Home
            case HomeOn
            case IcCrown
            case Ikura
            case Ink00
            case Islocked
            case Isvcenabled
            case Kutsu
            case Mask
            case Memory
            case NewRoute
            case Private
            case Qr
            case QrCodeIcon
            case Regular
            case RightStick
            case RoomCreator
            case Schedule
            case ScheduleOn
            case Settings
            case SideOrder
            case Stage
            case TapeGray
            case TapeSub
            case TeamContest
            case TitleBg
            case Tri
            case Wave
            case WaveBg
            case Work
            case X
            case XCrown
            case Xranking
            case XrankingTitleIcon
            case Yagura
            
            public static let allCases: AllCases = [
                .Album,
                .Area,
                .Arrow,
                .Asari,
                .Atama,
                .Bankara,
                .Battle,
                .BattleOn,
                .BigRun,
                .Boss,
                .Buki,
                .Catalog,
                .Challenge,
                .Coop,
                .CoopOn,
                .Event,
                .Fest,
                .Fuku,
                .Gesotown,
                .GesotownCoin,
                .GesotownItemBg,
                .GoldIkura,
                .HelpedOcto,
                .HelpedSquid,
                .Hero,
                .Himedrone,
                .History,
                .Hoko,
                .HolpenOcto,
                .HolpenSquid,
                .Home,
                .HomeOn,
                .IcCrown,
                .Ikura,
                .Ink00,
                .Islocked,
                .Isvcenabled,
                .Kutsu,
                .Mask,
                .Memory,
                .NewRoute,
                .Private,
                .Qr,
                .QrCodeIcon,
                .Regular,
                .RightStick,
                .RoomCreator,
                .Schedule,
                .ScheduleOn,
                .Settings,
                .SideOrder,
                .Stage,
                .TapeGray,
                .TapeSub,
                .TeamContest,
                .TitleBg,
                .Tri,
                .Wave,
                .WaveBg,
                .Work,
                .X,
                .XCrown,
                .Xranking,
                .XrankingTitleIcon,
                .Yagura,
            ]
            
            public var rawValue: RawValue {
                switch self {
                case .Album:
                    return "album.svg"
                case .Area:
                    return "area.svg"
                case .Arrow:
                    return "arrow.svg"
                case .Asari:
                    return "asari.svg"
                case .Atama:
                    return "atama.svg"
                case .Bankara:
                    return "bankara.svg"
                case .Battle:
                    return "battle.svg"
                case .BattleOn:
                    return "battle--on.svg"
                case .BigRun:
                    return "big_run.svg"
                case .Boss:
                    return "boss.svg"
                case .Buki:
                    return "buki.svg"
                case .Catalog:
                    return "catalog.svg"
                case .Challenge:
                    return "challenge.svg"
                case .Coop:
                    return "coop.svg"
                case .CoopOn:
                    return "coop--on.svg"
                case .Event:
                    return "event.svg"
                case .Fest:
                    return "fest.svg"
                case .Fuku:
                    return "fuku.svg"
                case .Gesotown:
                    return "gesotown.svg"
                case .GesotownCoin:
                    return "gesotown-coin.svg"
                case .GesotownItemBg:
                    return "gesotown-item-bg.svg"
                case .GoldIkura:
                    return "gold-ikura.svg"
                case .HelpedOcto:
                    return "helped-octo.svg"
                case .HelpedSquid:
                    return "helped-squid.svg"
                case .Hero:
                    return "hero.svg"
                case .Himedrone:
                    return "himeDrone.svg"
                case .History:
                    return "history.svg"
                case .Hoko:
                    return "hoko.svg"
                case .HolpenOcto:
                    return "holpen-octo.svg"
                case .HolpenSquid:
                    return "holpen-squid.svg"
                case .Home:
                    return "home.svg"
                case .HomeOn:
                    return "home--on.svg"
                case .IcCrown:
                    return "ic_crown.svg"
                case .Ikura:
                    return "ikura.svg"
                case .Ink00:
                    return "ink_00.svg"
                case .Islocked:
                    return "isLocked.svg"
                case .Isvcenabled:
                    return "isVcEnabled.svg"
                case .Kutsu:
                    return "kutsu.svg"
                case .Mask:
                    return "mask.svg"
                case .Memory:
                    return "memory.svg"
                case .NewRoute:
                    return "new-route.svg"
                case .Private:
                    return "private.svg"
                case .Qr:
                    return "qr.svg"
                case .QrCodeIcon:
                    return "qr-code-icon.svg"
                case .Regular:
                    return "regular.svg"
                case .RightStick:
                    return "right_stick.svg"
                case .RoomCreator:
                    return "room-creator.svg"
                case .Schedule:
                    return "schedule.svg"
                case .ScheduleOn:
                    return "schedule--on.svg"
                case .Settings:
                    return "settings.svg"
                case .SideOrder:
                    return "side-order.svg"
                case .Stage:
                    return "stage.svg"
                case .TapeGray:
                    return "tape_gray.svg"
                case .TapeSub:
                    return "tape_sub.svg"
                case .TeamContest:
                    return "team_contest.svg"
                case .TitleBg:
                    return "title_bg.svg"
                case .Tri:
                    return "tri.svg"
                case .Wave:
                    return "wave.svg"
                case .WaveBg:
                    return "wave-bg.svg"
                case .Work:
                    return "work.svg"
                case .X:
                    return "x.svg"
                case .XCrown:
                    return "x_crown.svg"
                case .Xranking:
                    return "xranking.svg"
                case .XrankingTitleIcon:
                    return "xranking-title-icon.svg"
                case .Yagura:
                    return "yagura.svg"
                }
            }
        }
        
        public enum PNG: String, StaticMedia {
            case Bg = "bg.png"
            case Bg1Alpha = "bg_1_alpha.png"
            case BgGray1 = "bg_gray_1.png"
            case Boss1Color = "boss1_color.png"
            case Boss2 = "boss2.png"
            case Boss2Color = "boss2_color.png"
            case Boss3 = "boss3.png"
            case Boss3Color = "boss3_color.png"
            case ChipCatDrone = "chip-cat-drone.png"
            case ChipCatLucky = "chip-cat-lucky.png"
            case ChipCatMove = "chip-cat-move.png"
            case CoopModalBg = "coop_modal_bg.png"
            case Feature1 = "feature1.png"
            case Feature2 = "feature2.png"
            case Feature3 = "feature3.png"
            case Feature4 = "feature4.png"
            case GesotownLogo = "gesotown-logo.png"
            case GesotownNextBrandnameBg = "gesotown-next-brandname-bg.png"
            case Hero = "hero.png"
            case IcRob = "ic_rob.png"
            case Kanban = "kanban.png"
            case Kumasan = "e2844c2c0cf806631e25f04a2c81d8ec.png"
            case Logo = "logo.png"
            case LogoDe = "logo_de.png"
            case LogoEs = "logo_es.png"
            case LogoFr = "logo_fr.png"
            case LogoIt = "logo_it.png"
            case LogoJp = "logo_jp.png"
            case LogoKr = "logo_kr.png"
            case LogoNl = "logo_nl.png"
            case LogoRu = "logo_ru.png"
            case LogoSc = "logo_sc.png"
            case LogoTc = "logo_tc.png"
            case LogoUs = "logo_us.png"
            case MyOutfits = "my-outfits.png"
            case Noise = "noise.png"
            case NoroshiMask = "noroshi-mask.png"
            case NoroshiTryInklingMask = "noroshi-try-inkling-mask.png"
            case NoroshiTryOctolingMask = "noroshi-try-octoling-mask.png"
            case Photo = "photo.png"
            case Stamp = "stamp.png"
            case RankGolden = "f3f63a0ebe384e5944a44322d928694c.png"
            case RankSilver = "babe22a6dd08b10d8830b2b799bbb047.png"
            case Tag = "tag.png"
            case Tape = "tape.png"
            case TapeBlob = "tape_blob.png"
            case TapeBlobGray = "tape_blob_gray.png"
            case TrophyBronze = "trophy-bronze.png"
            case TrophyGold = "trophy-gold.png"
            case TrophySilver = "trophy-silver.png"
            case UrokoBronze = "415b5d869cc97c69f7391b17c0168f23.png"
            case UrokoGolden = "966a78686b944cd2dd95c6a978fbee2b.png"
            case UrokoSilver = "026392fb213a60b54832921594fd2759.png"
            case Welcome = "welcome.png"
        }
        
        public enum WOFF: String, StaticMedia {
            case Splatoon1ChzhLevel1 = "Splatoon1CHzh-level1.woff"
            case Splatoon1ChzhLevel2 = "Splatoon1CHzh-level2.woff"
            case Splatoon1JpHiraganaKatakana = "Splatoon1JP-hiragana-katakana.woff"
            case Splatoon1JpLevel1 = "Splatoon1JP-level1.woff"
            case Splatoon1JpLevel2 = "Splatoon1JP-level2.woff"
            case Splatoon1KrkoLevel1 = "Splatoon1KRko-level1.woff"
            case Splatoon1KrkoLevel2 = "Splatoon1KRko-level2.woff"
            case Splatoon1TwzhLevel1 = "Splatoon1TWzh-level1.woff"
            case Splatoon2ChzhLevel1 = "Splatoon2CHzh-level1.woff"
            case Splatoon2ChzhLevel2 = "Splatoon2CHzh-level2.woff"
            case Splatoon2Common = "Splatoon2-common.woff"
            case Splatoon2JpHiraganaKatakana = "Splatoon2JP-hiragana-katakana.woff"
            case Splatoon2JpLevel1 = "Splatoon2JP-level1.woff"
            case Splatoon2JpLevel2 = "Splatoon2JP-level2.woff"
            case Splatoon2KrkoLevel1 = "Splatoon2KRko-level1.woff"
            case Splatoon2KrkoLevel2 = "Splatoon2KRko-level2.woff"
            case Splatoon2SymbolCommon = "Splatoon2-symbol-common.woff"
            case Splatoon2TwzhLevel1 = "Splatoon2TWzh-level1.woff"
            case Splatoon2TwzhLevel2 = "Splatoon2TWzh-level2.woff"
        }
        
        public enum WOFF2: String, StaticMedia {
            case Splatoon1ChzhLevel1 = "Splatoon1CHzh-level1.woff2"
            case Splatoon1ChzhLevel2 = "Splatoon1CHzh-level2.woff2"
            case Splatoon1CjkCommon = "Splatoon1-cjk-common.woff2"
            case Splatoon1Common = "Splatoon1-common.woff2"
            case Splatoon1JpHiraganaKatakana = "Splatoon1JP-hiragana-katakana.woff2"
            case Splatoon1JpLevel1 = "Splatoon1JP-level1.woff2"
            case Splatoon1JpLevel2 = "Splatoon1JP-level2.woff2"
            case Splatoon1KrkoLevel1 = "Splatoon1KRko-level1.woff2"
            case Splatoon1KrkoLevel2 = "Splatoon1KRko-level2.woff2"
            case Splatoon1SymbolCommon = "Splatoon1-symbol-common.woff2"
            case Splatoon1TwzhLevel1 = "Splatoon1TWzh-level1.woff2"
            case Splatoon1TwzhLevel2 = "Splatoon1TWzh-level2.woff2"
            case Splatoon2ChzhLevel1 = "Splatoon2CHzh-level1.woff2"
            case Splatoon2ChzhLevel2 = "Splatoon2CHzh-level2.woff2"
            case Splatoon2CjkCommon = "Splatoon2-cjk-common.woff2"
            case Splatoon2Common = "Splatoon2-common.woff2"
            case Splatoon2JpHiraganaKatakana = "Splatoon2JP-hiragana-katakana.woff2"
            case Splatoon2JpLevel1 = "Splatoon2JP-level1.woff2"
            case Splatoon2JpLevel2 = "Splatoon2JP-level2.woff2"
            case Splatoon2KrkoLevel1 = "Splatoon2KRko-level1.woff2"
            case Splatoon2KrkoLevel2 = "Splatoon2KRko-level2.woff2"
            case Splatoon2SymbolCommon = "Splatoon2-symbol-common.woff2"
            case Splatoon2TwzhLevel1 = "Splatoon2TWzh-level1.woff2"
            case Splatoon2TwzhLevel2 = "Splatoon2TWzh-level2.woff2"
        }
    }
    
    public enum ThirdParty {
        public enum Leanny: String, CaseIterable, Identifiable {
            /// 保存先のローカルURL
            var assetURL: URL {
                // swiftlint:disable:next force_unwrapping
                let baseURL: URL = .init(string: "https://leanny.github.io")!
                switch self {
                case .SakeBigMouth, .Sakedozer, .SakelinenGolden:
                    return baseURL
                        .appendingPathComponent("resources/prod/v2/coop_enemy_img")
                        .appendingPathComponent(id)
                        .appendingPathExtension(for: .png)
                default:
                    return baseURL
                        .appendingPathComponent("resources/prod/v2/weapon_illust")
                        .appendingPathComponent(id)
                        .appendingPathExtension(for: .png)
                }
            }
            
            // 取得先のURL
            var url: URL {
                // swiftlint:disable:next force_unwrapping
                let baseURL: URL = .init(string: "https://leanny.github.io")!
                switch self {
                case .SakeBigMouth, .Sakedozer, .SakelinenGolden:
                    return baseURL
                        .appendingPathComponent("splat3/images/coopEnemy")
                        .appendingPathComponent(rawValue)
                        .appendingPathExtension(for: .png)
                default:
                    return baseURL
                        .appendingPathComponent("splat3/images/weapon_flat")
                        .appendingPathComponent(rawValue)
                        .appendingPathExtension(for: .png)
                }
            }
            
            public var id: String {
                switch self {
                case .SakelinenGolden:
                    return "a35aa2982499e9a404fdb81f72fbaf553bc47f7682cc67f9b8c32ca9910e2cbf"
                case .Sakedozer:
                    return "8cd6dd3e1bb480e2897afdb434315bc78876204a0995c1552084e1d3edfe0536"
                case .SakeBigMouth:
                    return "f0dd8c7eb5c2e96f347564cac71affe055f6c45a3339145ecc81287f800759d2"
                case .Blaster_Bear:
                    return "0962405d6aecff4a075c46e895c42984e33b26c4b2b4b25c5058366db3c35ba4"
                case .Roller_Bear:
                    return "ea9dd38bbce1cd8b879f59b5afc97a47d79cd413ad8d2fcbb504a2ac8f01036e"
                case .Charger_Bear:
                    return "5cc158250a207241f51d767a47bbb6139fe1c4fb652cc182b73aac93baa659c5"
                case .Slosher_Bear:
                    return "bf89bcf3d3a51badd78b436266e6b7927d99ac386e083023df3551da6b39e412"
                case .Maneuver_Bear:
                    return "411abcfee82b63a97af1613885b90daa449f4a847eff6c1d7f093b705040a9f0"
                case .Shelter_Bear:
                    return "3380019464e3111a0f40e633be25f73ad34ec1844d2dc7852a349b29b238932b"
                case .Stringer_Bear:
                    return "36e03d8d1e6bc4f7449c5450f4410c6c8449cde0548797d22ab641cd488d2060"
                case .Saber_Bear:
                    return "480bc1dfb0beed1ce4625a6a6b035e4bac711de019bb9b0e5125e4e7e39e0719"
                }
            }
            
            case SakeBigMouth = "SakeBigMouth"
            case Sakedozer = "Sakedozer"
            case SakelinenGolden = "SakelienGolden"
            case Blaster_Bear = "Path_Wst_Blaster_Bear"
            case Maneuver_Bear = "Path_Wst_Maneuver_Bear"
            case Roller_Bear = "Path_Wst_Roller_Bear"
            case Saber_Bear = "Path_Wst_Saber_Bear"
            case Shelter_Bear = "Path_Wst_Shelter_Bear"
            case Slosher_Bear = "Path_Wst_Slosher_Bear"
            case Stringer_Bear = "Path_Wst_Stringer_Bear"
            case Charger_Bear = "Path_Wst_Charger_Bear"
        }
        
        public enum SplatoonInk: String, CaseIterable, Identifiable {
            public var id: RawValue { rawValue }
            
            /// 保存先のローカルURL
            var assetURL: URL {
                // swiftlint:disable:next force_unwrapping
                let baseURL: URL = .init(string: "https://splatoon3.ink")!
                switch self {
                case .RandomGreen, .RandomGold, .Unknown:
                    return baseURL
                        .appendingPathComponent("resources/prod/v2/ui_img")
                        .appendingPathComponent(id)
                        .appendingPathExtension(for: .png)
                default:
                    return baseURL
                        .appendingPathComponent("resources/prod/v2/stage_img/icon/high_resolution")
                        .appendingPathComponent(id)
                        .appendingPathExtension(for: .png)
                }
            }
            
            // 取得先のURL
            var url: URL {
                // swiftlint:disable:next force_unwrapping
                let baseURL: URL = .init(string: "https://splatoon3.ink")!
                switch self {
                case .RandomGreen, .RandomGold, .Unknown:
                    return baseURL
                        .appendingPathComponent("assets/splatnet/v2/ui_img")
                        .appendingPathComponent(rawValue)
                        .appendingPathExtension(for: .png)
                default:
                    return baseURL
                        .appendingPathComponent("assets/splatnet/v2/stage_img/icon/high_resolution")
                        .appendingPathComponent(rawValue)
                        .appendingPathExtension(for: .png)
                }
            }
            
            case RandomGreen = "a23d035e2f37c502e85b6065ba777d93f42d6ca7017ed029baac6db512e3e17f_0"
            case RandomGold = "9d7272733ae2f2282938da17d69f13419a935eef42239132a02fcf37d8678f10_0"
            case Unknown = "473fffb2442075078d8bb7125744905abdeae651b6a5b7453ae295582e45f7d1_0"
            case Random = "53e1af84e02048eaf93c283489026a92d3a170eb3ebdf300c124cbe4e553e63b_0"
        }
    }
}
