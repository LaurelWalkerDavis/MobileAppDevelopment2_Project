//
//  ContemplationViewModel.swift
//  IgnatianPractices
//
//  Created by Laurel Walker Davis on 4/17/23.
//

import Foundation

class ContemplationViewModel : ObservableObject {
    @Published private(set) var contemplationImages = [
        ContemplationModel(fileName: "Baptism_Slovakia", description: "Baptism of Jesus by John the Baptist", credit: "Baptism of Jesus Christ by John the Baptist, graphic collage from engraving of Nazareene School, published in The Holy Bible, St.Vojtech Publishing, Trnava, Slovakia, 1937. ©fluenta - stock.adobe.com"),
        ContemplationModel(fileName: "Baptism_Slovakia", description: "Baptism of Jesus by John the Baptist", credit: "Baptism of Jesus Christ by John the Baptist, graphic collage from engraving of Nazareene School, published in The Holy Bible, St.Vojtech Publishing, Trnava, Slovakia, 1937. ©fluenta - stock.adobe.com"),
        ContemplationModel(fileName: "Baptism_Slovakia", description: "Baptism of Jesus by John the Baptist", credit: "Baptism of Jesus Christ by John the Baptist, graphic collage from engraving of Nazareene School, published in The Holy Bible, St.Vojtech Publishing, Trnava, Slovakia, 1937. ©fluenta - stock.adobe.com"),
        ContemplationModel(fileName: "Baptism_Slovakia", description: "Baptism of Jesus by John the Baptist", credit: "Baptism of Jesus Christ by John the Baptist, graphic collage from engraving of Nazareene School, published in The Holy Bible, St.Vojtech Publishing, Trnava, Slovakia, 1937. ©fluenta - stock.adobe.com"),
        ContemplationModel(fileName: "Baptism_Slovakia", description: "Baptism of Jesus by John the Baptist", credit: "Baptism of Jesus Christ by John the Baptist, graphic collage from engraving of Nazareene School, published in The Holy Bible, St.Vojtech Publishing, Trnava, Slovakia, 1937. ©fluenta - stock.adobe.com"),
        ContemplationModel(fileName: "Baptism_Slovakia", description: "Baptism of Jesus by John the Baptist", credit: "Baptism of Jesus Christ by John the Baptist, graphic collage from engraving of Nazareene School, published in The Holy Bible, St.Vojtech Publishing, Trnava, Slovakia, 1937. ©fluenta - stock.adobe.com"),
        ContemplationModel(fileName: "Baptism_Slovakia", description: "Baptism of Jesus by John the Baptist", credit: "Baptism of Jesus Christ by John the Baptist, graphic collage from engraving of Nazareene School, published in The Holy Bible, St.Vojtech Publishing, Trnava, Slovakia, 1937. ©fluenta - stock.adobe.com"),
        ContemplationModel(fileName: "Baptism_Slovakia", description: "Baptism of Jesus by John the Baptist", credit: "Baptism of Jesus Christ by John the Baptist, graphic collage from engraving of Nazareene School, published in The Holy Bible, St.Vojtech Publishing, Trnava, Slovakia, 1937. ©fluenta - stock.adobe.com"),
        ContemplationModel(fileName: "Baptism_Slovakia", description: "Baptism of Jesus by John the Baptist", credit: "Baptism of Jesus Christ by John the Baptist, graphic collage from engraving of Nazareene School, published in The Holy Bible, St.Vojtech Publishing, Trnava, Slovakia, 1937. ©fluenta - stock.adobe.com"),
        ContemplationModel(fileName: "Baptism_Slovakia", description: "Baptism of Jesus by John the Baptist", credit: "Baptism of Jesus Christ by John the Baptist, graphic collage from engraving of Nazareene School, published in The Holy Bible, St.Vojtech Publishing, Trnava, Slovakia, 1937. ©fluenta - stock.adobe.com"),
        ContemplationModel(fileName: "Baptism_Slovakia", description: "Baptism of Jesus by John the Baptist", credit: "Baptism of Jesus Christ by John the Baptist, graphic collage from engraving of Nazareene School, published in The Holy Bible, St.Vojtech Publishing, Trnava, Slovakia, 1937. ©fluenta - stock.adobe.com")
    ]
    
    
    func getTodaysImage() -> ContemplationModel {
        let index = Int.random(in: 0...10)
        return contemplationImages[index]
    }
    
}

