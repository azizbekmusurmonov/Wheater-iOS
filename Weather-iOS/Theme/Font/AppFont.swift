
import UIKit

extension UIFont {
    
    public static func appFont(_ siz: CGFloat, _ type: FontTypes = .FONT_MEDIUM) -> UIFont {
        let size = isXModel ? siz : siz * 0.86
        switch type {
        case .FONT_BLACK : return UIFont(name: "SFUIDisplay-Black", size: size) ?? UIFont.systemFont(ofSize: size)
        case .FONT_BOLD : return UIFont(name: "SFUIDisplay-Bold", size: size) ?? UIFont.boldSystemFont(ofSize: size)
        case .FONT_HEAVY : return UIFont(name: "SFUIDisplay-Heavy", size: size) ?? UIFont.boldSystemFont(ofSize: size)
        case .FONT_LIGHT : return UIFont(name: "SFUIDisplay-Light", size: size) ?? UIFont.systemFont(ofSize: size)
        case .FONT_MEDIUM : return UIFont(name: "SFUIDisplay-Medium", size: size) ?? UIFont.systemFont(ofSize: size)
        case .FONT_SEMI_BOLD : return UIFont(name: "SFUIDisplay-Semibold", size: size) ?? UIFont.systemFont(ofSize: size)
        case .FONT_THIN : return UIFont(name: "SFUIDisplay-Thin", size: size) ?? UIFont.systemFont(ofSize: size)
        case .FONT_ULTRA_THIN : return UIFont(name: "SFUIDisplay-Ultralight", size: size) ?? UIFont.systemFont(ofSize: size)
        }
    }
    
    public enum FontTypes{
        case FONT_BLACK
        case FONT_BOLD
        case FONT_HEAVY
        case FONT_LIGHT
        case FONT_MEDIUM
        case FONT_SEMI_BOLD
        case FONT_THIN
        case FONT_ULTRA_THIN
    }
    
    
}
