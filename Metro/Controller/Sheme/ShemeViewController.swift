//
//  ShemeViewController.swift
//  Metro
//
//  Created by air on 16.11.2017.
//  Copyright © 2017 Nikita Kuratnik. All rights reserved.
//

import UIKit
import GoogleMaps

class ShemeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        
        
        let camera = GMSCameraPosition.camera(withLatitude: 53.901511, longitude: 27.556691, zoom: 11.5)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        
        mapView.isMyLocationEnabled = true
        mapView.settings.compassButton = true
        mapView.settings.myLocationButton = true
        
        if let mylocation = mapView.myLocation {
            print("User's location: \(mylocation)")
        } else {
            print("User's location is unknown")
        }
        
        view = mapView
        
        
        //MARK: Auto line
        
        
        let pathAuto = GMSMutablePath()
        
        pathAuto.add(CLLocationCoordinate2D(latitude: 53.861805, longitude: 27.674726))
        pathAuto.add(CLLocationCoordinate2D(latitude: 53.869854, longitude: 27.645913))
        pathAuto.add(CLLocationCoordinate2D(latitude: 53.874793, longitude: 27.629419869854))
        pathAuto.add(CLLocationCoordinate2D(latitude: 53.889414, longitude: 27.615208))
        pathAuto.add(CLLocationCoordinate2D(latitude: 53.889682, longitude: 27.585530))
        pathAuto.add(CLLocationCoordinate2D(latitude: 53.893834, longitude: 27.570505))
        pathAuto.add(CLLocationCoordinate2D(latitude: 53.901393, longitude: 27.560947))
        pathAuto.add(CLLocationCoordinate2D(latitude: 53.905690, longitude: 27.553977))
        pathAuto.add(CLLocationCoordinate2D(latitude: 53.905271, longitude: 27.539174))
        pathAuto.add(CLLocationCoordinate2D(latitude: 53.906384, longitude: 27.522528))
        pathAuto.add(CLLocationCoordinate2D(latitude: 53.909112, longitude: 27.496169))
        pathAuto.add(CLLocationCoordinate2D(latitude: 53.908364, longitude: 27.481989))
        pathAuto.add(CLLocationCoordinate2D(latitude: 53.906532, longitude: 27.454190))
        pathAuto.add(CLLocationCoordinate2D(latitude: 53.906860, longitude: 27.437713))

        let polyline = GMSPolyline(path: pathAuto)
        polyline.strokeWidth = 7.0
        polyline.strokeColor = .red
        polyline.map = mapView
        
        let mogilevskay = GMSMarker()
        mogilevskay.position = CLLocationCoordinate2D(latitude: 53.861805, longitude: 27.674726)
        mogilevskay.title = "Могилевская"
        mogilevskay.map = mapView
        
        let autozavodskay = GMSMarker()
        autozavodskay.position = CLLocationCoordinate2D(latitude: 53.869854, longitude: 27.645913)
        autozavodskay.title = "Автозаводская"
        autozavodskay.map = mapView
        
        let partizanskay = GMSMarker()
        partizanskay.position = CLLocationCoordinate2D(latitude: 53.874793, longitude: 27.629419869854)
        partizanskay.title = "Партизанская"
        partizanskay.map = mapView
        
        let traktorZavod = GMSMarker()
        traktorZavod.position = CLLocationCoordinate2D(latitude: 53.889414, longitude: 27.615208)
        traktorZavod.title = "Тракторный завод"
        traktorZavod.map = mapView
        
        let proletarskay = GMSMarker()
        proletarskay.position = CLLocationCoordinate2D(latitude: 53.889682, longitude: 27.585530)
        proletarskay.title = "Пролетарская"
        proletarskay.map = mapView
        
        let pervomaiskay = GMSMarker()
        pervomaiskay.position = CLLocationCoordinate2D(latitude: 53.893834, longitude: 27.570505)
        pervomaiskay.title = "Первомайская"
        pervomaiskay.map = mapView
        
        let kupalovskay = GMSMarker()
        kupalovskay.position = CLLocationCoordinate2D(latitude: 53.901393, longitude: 27.560947)
        kupalovskay.title = "Купаловская"
        kupalovskay.map = mapView
        
        let nemiga = GMSMarker()
        nemiga.position = CLLocationCoordinate2D(latitude: 53.905690, longitude: 27.553977)
        nemiga.title = "Немига"
        nemiga.map = mapView
        
        let frunzenskay = GMSMarker()
        frunzenskay.position = CLLocationCoordinate2D(latitude: 53.905271, longitude: 27.539174)
        frunzenskay.title = "Фрунзенская"
        frunzenskay.map = mapView
        
        let molodejnay = GMSMarker()
        molodejnay.position = CLLocationCoordinate2D(latitude: 53.906384, longitude: 27.522528)
        molodejnay.title = "Молодежная"
        molodejnay.map = mapView
        
        let pushkinskay = GMSMarker()
        pushkinskay.position = CLLocationCoordinate2D(latitude: 53.909112, longitude: 27.496169)
        pushkinskay.title = "Пушкинская"
        pushkinskay.map = mapView
        
        let sportivnay = GMSMarker()
        sportivnay.position = CLLocationCoordinate2D(latitude: 53.908364, longitude: 27.481989)
        sportivnay.title = "Спортивная"
        sportivnay.map = mapView
        
        let kuncevshina = GMSMarker()
        kuncevshina.position = CLLocationCoordinate2D(latitude: 53.906532, longitude: 27.454190)
        kuncevshina.title = "Кунцевщина"
        kuncevshina.map = mapView
        
        let kamenaayGorka = GMSMarker()
        kamenaayGorka.position = CLLocationCoordinate2D(latitude: 53.906860, longitude: 27.437713)
        kamenaayGorka.title = "Каменая горка"
        kamenaayGorka.map = mapView
        
        
        //MARK: Moscow line
        
        
        let pathMoscow = GMSMutablePath()
        pathMoscow.add(CLLocationCoordinate2D(latitude: 53.849452, longitude: 27.474985))
        pathMoscow.add(CLLocationCoordinate2D(latitude: 53.864053, longitude: 27.485395))
        pathMoscow.add(CLLocationCoordinate2D(latitude: 53.876935, longitude: 27.497077))
        pathMoscow.add(CLLocationCoordinate2D(latitude: 53.886665, longitude: 27.514742))
        pathMoscow.add(CLLocationCoordinate2D(latitude: 53.885236, longitude: 27.539445))
        pathMoscow.add(CLLocationCoordinate2D(latitude: 53.894744, longitude: 27.548228))
        pathMoscow.add(CLLocationCoordinate2D(latitude: 53.902311, longitude: 27.563071))
        pathMoscow.add(CLLocationCoordinate2D(latitude: 53.908142, longitude: 27.575418))
        pathMoscow.add(CLLocationCoordinate2D(latitude: 53.915405, longitude: 27.582992))
        pathMoscow.add(CLLocationCoordinate2D(latitude: 53.922105, longitude: 27.600487))
        pathMoscow.add(CLLocationCoordinate2D(latitude: 53.923820, longitude: 27.611350))
        pathMoscow.add(CLLocationCoordinate2D(latitude: 53.927956, longitude: 27.627754))
        pathMoscow.add(CLLocationCoordinate2D(latitude: 53.934464, longitude: 27.651254))
        pathMoscow.add(CLLocationCoordinate2D(latitude: 53.938421, longitude: 27.666371))
        pathMoscow.add(CLLocationCoordinate2D(latitude: 53.945374, longitude: 27.687908))
        
        
        let polylineMoscow = GMSPolyline(path: pathMoscow)
        polylineMoscow.strokeWidth = 7.0
        polylineMoscow.strokeColor = .blue
        polylineMoscow.map = mapView
        
        let malinovka = GMSMarker()
        malinovka.position = CLLocationCoordinate2D(latitude: 53.849452, longitude: 27.474985)
        malinovka.title = "Малиновка"
        malinovka.map = mapView
        
        let petrovschina = GMSMarker()
        petrovschina.position = CLLocationCoordinate2D(latitude: 53.864053, longitude: 27.485395)
        petrovschina.title = "Петровщина"
        petrovschina.map = mapView
        
        let mihalovo = GMSMarker()
        mihalovo.position = CLLocationCoordinate2D(latitude: 53.876935, longitude: 27.497077)
        mihalovo.title = "Михалово"
        mihalovo.map = mapView
        
        let grushevka = GMSMarker()
        grushevka.position = CLLocationCoordinate2D(latitude: 53.886665, longitude: 27.514742)
        grushevka.title = "Грушевка"
        grushevka.map = mapView
        
        let institutKultury = GMSMarker()
        institutKultury.position = CLLocationCoordinate2D(latitude: 53.885236, longitude: 27.539445)
        institutKultury.title = "Институт культуры"
        institutKultury.map = mapView
        
        let plLenina = GMSMarker()
        plLenina.position = CLLocationCoordinate2D(latitude: 53.894744, longitude: 27.548228)
        plLenina.title = "Площадь Ленина"
        plLenina.map = mapView
        
        let oktybrskay = GMSMarker()
        oktybrskay.position = CLLocationCoordinate2D(latitude: 53.902311, longitude: 27.563071)
        oktybrskay.title = "Октябрьская"
        oktybrskay.map = mapView
        
        let plPobedi = GMSMarker()
        plPobedi.position = CLLocationCoordinate2D(latitude: 53.908142, longitude: 27.575418)
        plPobedi.title = "Площадь победы"
        plPobedi.map = mapView
        
        let plYakubaKolosa = GMSMarker()
        plYakubaKolosa.position = CLLocationCoordinate2D(latitude: 53.915405, longitude: 27.582992)
        plYakubaKolosa.title = "Площадь Я.Колосв"
        plYakubaKolosa.map = mapView
        
        let akademiaNauk = GMSMarker()
        akademiaNauk.position = CLLocationCoordinate2D(latitude: 53.922105, longitude: 27.600487)
        akademiaNauk.title = "Академия наук"
        akademiaNauk.map = mapView
        
        let parkCheliskincev = GMSMarker()
        parkCheliskincev.position = CLLocationCoordinate2D(latitude: 53.923820, longitude: 27.611350)
        parkCheliskincev.title = "Парк Челюскинцев"
        parkCheliskincev.map = mapView
        
        let moskovskay = GMSMarker()
        moskovskay.position = CLLocationCoordinate2D(latitude: 53.927956, longitude: 27.627754)
        moskovskay.title = "Московская"
        moskovskay.map = mapView
        
        let vostok = GMSMarker()
        vostok.position = CLLocationCoordinate2D(latitude: 53.934464, longitude: 27.651254)
        vostok.title = "Восток"
        vostok.map = mapView
        
        let borisovskiTrakt = GMSMarker()
        borisovskiTrakt.position = CLLocationCoordinate2D(latitude: 53.938421, longitude: 27.666371)
        borisovskiTrakt.title = "Борисовский тракт"
        borisovskiTrakt.map = mapView
        
        let uruchie = GMSMarker()
        uruchie.position = CLLocationCoordinate2D(latitude: 53.945374, longitude: 27.687908)
        uruchie.title = "Уручье"
        uruchie.map = mapView
        
        
    }
   
}
