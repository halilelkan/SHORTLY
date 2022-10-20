//
//  ErrorMessage.swift
//  SHORTLY
//
//  Created by halil ibrahim Elkan on 30.07.2022.
//

import Foundation

class ErrorMessageAlert {
    
    var errorMessage:String = ""
    
    func dene(errorCode: Int){
        
        switch errorCode {
            
        case 1:
            errorMessage = "URL Belirtilmedi"
        case 2:
            errorMessage = "Geçersiz URL girildi"
        case 3:
            errorMessage = "Hız sınırına ulaşıldı. Bir saniye bekleyin ve tekrar deneyin"
        case 4:
            errorMessage = "Hizmet şartlarımızı ihlal ettiği için IP Adresi engellendi"
        case 5:
            errorMessage = "shortencode kodu (slug) zaten alınmış/kullanımda"
        case 6:
            errorMessage = "Bilinmeyen hata"
        case 7:
            errorMessage = "Kod belirtilmedi (kod parametresi boş)"
        case 8:
            errorMessage = "Geçersiz kod gönderildi kod bulunamadı/böyle bir kısa bağlantı yok"
        case 9:
            errorMessage = "Gerekli parametreler eksik"
        case 10:
            errorMessage = "İzin verilmeyen bir bağlantı"
        
        default:
            break
        }
    
    }
}
